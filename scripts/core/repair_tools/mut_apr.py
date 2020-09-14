import json
import datetime

from typing import List
from pathlib import Path

from core.repair_tool import RepairTool
from core.input_parser import add_repair_tool
from core.runner.repair_task import RepairTask
from distutils.dir_util import copy_tree


def _regex_file(folder: Path, name: str, regex: str):
    re_file = folder / Path(name)

    with re_file.open(mode="w") as rf:
        rf.write(regex)
        return re_file


class MutApr(RepairTool):
    """MUT-APR"""

    def __init__(self, pos_tests: int, neg_tests: int, **kwargs):
        super(MutApr, self).__init__(name="MutApr", **kwargs)
        self.pos_tests = pos_tests
        self.neg_tests = neg_tests

    def repair(self, repair_task: RepairTask):
        """"
        :type repair_task: RepairTask
        """
        # checkouts the challenge binary to a temporary path
        benchmark = repair_task.benchmark
        challenge = benchmark.init_challenge(self.name, repair_task.challenge)
        benchmark.compile(challenge, preprocess=True)

        # checkouts the challenge binary to a temporary path
        self._init_log_file(folder=Path(self.name, challenge.name, str(self.seed)),
                            file=Path("tool.log"))

        try:
            self.begin()
            results = ""
            prefix = benchmark.prefix(challenge)
            vuln_files = challenge.get_manifest(preprocessed=True)
            # instrument manifest files
            inst_program_path = self.get_repair_tools_path() / Path(self.repair_config["inst"]["program"])
            inst_files = self._instrument(working_dir=challenge.working_dir,
                                          program_path=inst_program_path,
                                          args=self.repair_config["inst"]["args"],
                                          files=vuln_files,
                                          prefix=prefix)
            self._coverage(inst_files=inst_files,
                           benchmark=benchmark,
                           challenge=challenge,
                           prefix=prefix)

            for file in vuln_files:
                results += self._modify(prefix / file, benchmark, challenge)

            return results

        finally:
            result = {
                "repair_begin": self.repair_begin,
                "repair_end": datetime.datetime.now().__str__(),
                "patches": []
            }
            repair_task.status = "FINISHED"
            '''
            results_path = os.path.join(self.working_dir.root, "repair")
            sanity_path = os.path.join(self.working_dir.root, "sanity")

            for file_path in challenge.manifest:
                ccp_file = c_to_ccp(file_path)
                repaired_file = os.path.join(results_path, ccp_file)
                sanity_file = os.path.join(sanity_path, ccp_file)

                if os.path.exists(repaired_file) and os.path.exists(sanity_file):
                    patch = {
                        "edits": []
                    }

                    diff_cmd = f"diff {sanity_file} {repaired_file}"
                    cmd = Command(diff_cmd)
                    out, err = cmd()

                    patch["patch"] = out
                    # TODO: Add edits to the patch
                    # patch['edits'].append(edit)
                    result["patches"].append(patch)
            '''
            results_path = self.log_dir / Path("result.json")

            with results_path.open("w+") as res:
                json.dump(result, res, indent=2)

            repair_task.results = result

            if len(result['patches']) > 0:
                repair_task.status = "PATCHED"

            rm_cmd = f"rm -rf {self.working_dir};"
            # subprocess.call(cmd, shell=True)

    def _instrument(self, working_dir: Path, program_path: Path, args: dict, files: List[Path],
                    prefix: Path) -> List[str]:
        inst_path = working_dir / self.configuration.dirs.instrument
        inst_path.mkdir(parents=True, exist_ok=True)
        inst_files = []

        for file in files:
            out_path = inst_path / file.parent

            if not out_path.exists():
                out_path.mkdir()

            out_file = out_path / file.name
            inst_files.append(str(out_file))
            args_str = ' '.join([f"{opt} {arg}" for opt, arg in args.items()])
            inst_cmd = f"{program_path} {args_str} {prefix / file}"

            with out_file.open(mode="w") as inst_file:
                # TODO: Fix parsing errorFatal error: exception Frontc.ParseError from coverage program
                #  mainly with source code
                out, err = super().__call__(cmd_str=inst_cmd)
                print(out, err)
                # TODO: fix this, for some reason the tool creates wrong path for coverage in the
                #  instrumented source code
                out = out.replace("fopen(\".//", 'fopen(\"/')
                inst_file.write(out)

        return inst_files

    def _coverage(self, inst_files: List[str], benchmark, challenge, prefix):
        benchmark.compile(challenge, inst_files, preprocess=True)

        # creates folder for coverage files
        cov_dir = challenge.working_dir / self.configuration.dirs.coverage
        cov_dir.mkdir(parents=True, exist_ok=True)

        benchmark.test(challenge=challenge, pos_tests=True, coverage={"cov_out_dir": cov_dir,
                                                                      "rename_suffix": ".goodpath"})
        benchmark.test(challenge=challenge, neg_tests=True, coverage={"cov_out_dir": cov_dir})

        copy_tree(cov_dir, prefix)


    def _fault_localization(self):
        # fault localization
        # print("Fault Localization")
        # fl_cmd = os.path.join(REPAIR_TOOLS_DIR, self.config["fault"]["program"])
        # args_str = ' '.join([f"{opt} {arg}" for opt, arg in self.config["fault"]["args"].items()])
        # fl_cmd =  f"{fl_cmd} {args_str} --pass {len(pos_tests)} --fail {len(neg_tests)} {cov_dir}/*"
        # cmd = Command(fl_cmd)
        # out, err = cmd(verbose=True, exit_err=True)
        # fl_out_file = self.working_dir.root / Path(self.config["fault"]["args"]["--fl"] + ".txt")
        # with fl_out_file.open(mode="w") as fl_out:
        #    fl_out.write(out)
        # (?P<exe_name>\.\/\d{5}-prog)\s+(?P<good_name>\d{5}-good)\s+(?P<count>\d{1,3})\s+(?P<port>\d{1,4})
        # fix faults
        pass

    def _modify(self, file: Path, benchmark, challenge):
        args_str = ' '.join([f"{opt} {arg}" for opt, arg in self.repair_config["args"].items()])

        cre = _regex_file(challenge.working_dir, "compile.txt", self.repair_config["regex"]["compile"])
        gre = _regex_file(challenge.working_dir, "good.txt", self.repair_config["regex"]["good"])
        bre = _regex_file(challenge.working_dir, "bad.txt", self.repair_config["regex"]["bad"])
        log_arg = f"{benchmark.log_file}"

        test_good = benchmark.test(challenge=challenge, regex=str(gre), pos_tests=True, prefix=challenge.working_dir,
                                   log_file=log_arg)
        test_bad = benchmark.test(challenge=challenge, regex=str(bre), neg_tests=True, prefix=challenge.working_dir,
                                  log_file=log_arg)
        compile_cmd = benchmark.compile(challenge=challenge, instrumented_files=[str(file)], regex=str(cre),
                                        log_file=log_arg, prefix=challenge.working_dir)

        modify_cmd = str(self.program)
        modify_cmd = modify_cmd + f" {args_str} {file}"
        # fix_cmd += f" --faultpath {fl_out_file}"
        modify_cmd += f" --gcc \"python3 {compile_cmd}\""
        modify_cmd += f" --good \"python3 {test_good}\""
        modify_cmd += f" --bad \"python3 {test_bad}\""

        out, err = super().__call__(cmd_str=modify_cmd,
                                    cmd_cwd=challenge.working_dir)

        return out


def mut_apr_args(input_parser):
    input_parser.add_argument('--version', action='version', version='MUT-APR')


parser = add_repair_tool("MUT-APR", MutApr, 'Repair challenges with MUT-APR')
mut_apr_args(parser)
