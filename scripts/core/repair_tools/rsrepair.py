#!/usr/bin/env python3

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


class RSRepair(RepairTool):
    """RSRepair"""

    def __init__(self, pos_tests: int, neg_tests: int, **kwargs):
        super(RSRepair, self).__init__(name="RSRepair", **kwargs)
        self.pos_tests = pos_tests
        self.neg_tests = neg_tests

    def repair(self, repair_task: RepairTask):
        """"
        :type repair_task: RepairTask
        """
        # checkouts the challenge binary to a temporary path
        benchmark = repair_task.benchmark
        challenge = benchmark.init_challenge(self.name, repair_task.challenge)
        # tool works with preprocessed files, makes part of the init
        benchmark.compile(challenge, preprocess=True)
        self._init_log_file(folder=Path(self.name, challenge.name, str(self.seed)),
                            file=Path("tool.log"))

        try:
            self.begin()
            results = ""
            repair_dir = challenge.working_dir / self.configuration.dirs.repair
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
                results += self._modify(prefix / file, benchmark=benchmark, challenge=challenge,
                                        repair_dir=repair_dir / Path(file.parent, file.stem))

            self.end()

            for file in vuln_files:
                self._get_patches(prefix=prefix, target_file=file,
                                  edits_path=repair_dir / Path(file.parent, file.stem))

            return results

        finally:
            repair_task.status = repair_task.results(self.repair_begin, self.repair_end, self.patches)
            repair_task.results.write()
            rm_cmd = f"rm -rf {challenge.working_dir};"
            #super().__call__(cmd_str=rm_cmd)

    def _get_patches(self, prefix: Path, target_file: Path, edits_path: Path):
        target_file_str = str(target_file)
        patch = {"target_file": target_file_str, "fix": "", "edits": []}

        baseline_path = prefix / Path(target_file_str + "-baseline.c")
        best_path = prefix / Path(target_file_str + "--best.c")

        if baseline_path.exists():
            if best_path.exists():
                patch["fix"] = self.diff(baseline_path, best_path)

            if edits_path.exists():
                for file in edits_path.iterdir():
                    if not file.is_dir() and file.suffix == ".c" and file.stat().st_size > 0:
                        patch["edits"].append(self.diff(baseline_path, file))

        self.patches.append(patch)

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

    def _modify(self, target_file: Path, benchmark, challenge, repair_dir: Path):
        repair_dir.mkdir(parents=True, exist_ok=True)
        args_str = ' '.join([f"{opt} {arg}" for opt, arg in self.repair_config["args"].items()])

        cre = _regex_file(challenge.working_dir, "compile.txt", self.repair_config["regex"]["compile"])
        gre = _regex_file(challenge.working_dir, "good.txt", self.repair_config["regex"]["good"])
        bre = _regex_file(challenge.working_dir, "bad.txt", self.repair_config["regex"]["bad"])
        log_arg = f"{benchmark.log_file}"

        test_good = benchmark.test(challenge=challenge, regex=str(gre), pos_tests=True, prefix=str(repair_dir),
                                   log_file=log_arg, neg_pov=True)
        test_bad = benchmark.test(challenge=challenge, regex=str(bre), neg_tests=True, prefix=str(repair_dir),
                                  log_file=log_arg, neg_pov=True)
        compile_cmd = benchmark.compile(challenge=challenge, instrumented_files=[str(target_file)], regex=str(cre),
                                        log_file=log_arg, prefix=str(repair_dir))

        modify_cmd = str(self.program)
        modify_cmd = modify_cmd + f" {args_str} {target_file}"
        # fix_cmd += f" --faultpath {fl_out_file}"
        modify_cmd += f" --gcc \"python3 {compile_cmd}\""
        modify_cmd += f" --good \"python3 {test_good}\""
        modify_cmd += f" --bad \"python3 {test_bad}\""

        out, err = super().__call__(cmd_str=modify_cmd,
                                    cmd_cwd=repair_dir)

        return out


def rsrepair_args(input_parser):
    input_parser.add_argument('--version', action='version', version='RSRepair')


parser = add_repair_tool("RSRepair", RSRepair, 'Repair challenges with RSRepair')
rsrepair_args(parser)
