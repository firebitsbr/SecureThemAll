import json
import datetime
from pathlib import Path

from core.input_parser import add_repair_tool
from core.repair_tool import RepairTool
from core.runner.repair_task import RepairTask
from ..utils.parse import c_to_cpp


class GenProg(RepairTool):
    """GenProg"""

    def __init__(self, pos_tests: int, neg_tests: int, **kwargs):
        super(GenProg, self).__init__(name="GenProg", **kwargs)
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

        self._init_log_file(folder=Path(self.name, challenge.name, str(self.seed)),
                            file=Path("tool.log"))

        try:
            repair_cmd = self._get_repair_cmd(benchmark=benchmark, challenge=challenge)
            self.begin()
            out, err = super().__call__(cmd_str=repair_cmd,
                                        cmd_cwd=str(challenge.working_dir))

            return out

        finally:
            result = {
                "repair_begin": self.repair_begin,
                "repair_end": datetime.datetime.now().__str__(),
                "patches": []
            }
            repair_task.status = "FINISHED"
            repair_path = challenge.working_dir / Path("repair")
            sanity_path = challenge.working_dir / Path("sanity")

            for file_path in challenge.manifest:
                ccp_file = c_to_cpp(file_path)
                repaired_file = repair_path / Path(ccp_file)
                sanity_file = sanity_path / Path(ccp_file)

                if repaired_file.exists() and sanity_file.exists():
                    patch = {
                        "edits": []
                    }

                    diff_cmd = f"diff {sanity_file} {repaired_file}"
                    out, err = super().__call__(cmd_str=diff_cmd, cmd_cwd=challenge.working_dir)

                    patch["patch"] = out
                    # TODO: Add edits to the patch
                    # patch['edits'].append(edit)
                    result["patches"].append(patch)

            results_path = self.log_dir / Path("result.json")

            with results_path.open("w+") as res:
                json.dump(result, res, indent=2)

            repair_task.results = result

            if len(result['patches']) > 0:
                repair_task.status = "PATCHED"

            rm_cmd = f"rm -rf {self.working_dir};"
            # subprocess.call(cmd, shell=True)

    def _get_repair_cmd(self, benchmark, challenge):
        arguments = self.repair_config["arguments"]
        arguments["--compiler-command"] = benchmark.compile(challenge, instrumented_files=["__SOURCE_NAME__"])
        arguments["--test-command"] = benchmark.test(challenge, tests=["__TEST_NAME__"], exit_fail=True)
        arguments["--prefix"] = benchmark.prefix(challenge)

        pos_tests, neg_tests = benchmark.count_tests(challenge)

        arguments["--pos-tests"] = str(pos_tests)
        arguments["--neg-tests"] = str(neg_tests)
        arguments["--rep"] = "cilpatch" if challenge.multi_file else "c"
        arguments["--program"] = challenge.manifest_path if challenge.multi_file else \
            challenge.get_manifest(preprocessed=True, string=True)

        repair_cmd = [str(self.program)]

        for opt, arg in arguments.items():
            if arg != "":
                repair_cmd.extend((opt, arg))
            else:
                repair_cmd.extend([opt])

        return repair_cmd


def genprog_args(input_parser):
    input_parser.add_argument('--version', action='version', version='GenProg e720256')


parser = add_repair_tool("GenProg", GenProg, 'Repair the challenge with GenProg')
genprog_args(parser)
