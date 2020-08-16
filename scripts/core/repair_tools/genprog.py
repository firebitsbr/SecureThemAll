import json
import os
import datetime

from config import REPAIR_TOOLS_DIR
from core.repair_tool import RepairTool
from scripts.core.input_parser import add_repair_tool
from core.runner.repair_task import RepairTask
from scripts.core.utils import test_command, compile_cpp_command, c_to_ccp

from benchmark.src.utils.command import Command
from benchmark.src.config import SOURCE_DIR


class GenProg(RepairTool):
    """GenProg"""

    def __init__(self, config_path: str, pos_tests: int, neg_tests: int, seed: int = 0):
        super(GenProg, self).__init__("GenProg", config_path)
        self.seed = seed
        self.pos_tests = pos_tests
        self.neg_tests = neg_tests
        self.manifest_file = "manifest.txt"

    def repair(self, repair_task: RepairTask):
        """"
        :type repair_task: RepairTask
        """
        challenge = repair_task.challenge
        # checkouts the challenge binary to a temporary path
        self.init_challenge(challenge)

        try:
            log_path = os.path.join(repair_task.log_dir, "repair.log")

            if not os.path.exists(os.path.dirname(log_path)):
                os.makedirs(os.path.dirname(log_path))

            repair_cmd = self.get_command(challenge)

            with open(log_path, 'w+') as log:
                log.write(' '.join(repair_cmd))
                log.flush()

                cmd = Command(repair_cmd, cwd=self.working_dir.root.absolute())
                cmd(verbose=True, file=log)

                return log.read()

        finally:
            result = {
                "repair_begin": self.repair_begin,
                "repair_end": datetime.datetime.now().__str__(),
                "patches": []
            }
            repair_task.status = "FINISHED"
            results_path = os.path.join(self.working_dir.root, "repair")

            for file_path in challenge.manifest:
                ccp_file = c_to_ccp(file_path)
                repaired_file = os.path.join(results_path, ccp_file)
                ccp_file = os.path.join(challenge.paths.cmake, ccp_file)

                if os.path.exists(repaired_file):
                    patch = {
                        "edits": []
                    }

                    diff_cmd = f"diff {repaired_file} {ccp_file}"
                    cmd = Command(diff_cmd)
                    out, err = cmd()

                    patch["patch"] = out
                    # TODO: Add edits to the patch
                    # patch['edits'].append(edit)
                    result["patches"].append(patch)

            with open(os.path.join(repair_task.log_dir, "result.json"), "w+") as fd2:
                json.dump(result, fd2, indent=2)

            repair_task.results = result

            if len(result['patches']) > 0:
                repair_task.status = "PATCHED"

            rm_cmd = f"rm -rf {self.working_dir};"
            # subprocess.call(cmd, shell=True)

    def write_manifest(self, manifest):
        path = f"{self.working_dir}/{self.manifest_file}"

        with open(path, "w") as mf:
            for file in manifest:
                mf.write(f"{c_to_ccp(file)}\n")

        return path

    def get_command(self, challenge):
        # parse the config
        arguments = self.config["arguments"]
        compile_cmd = compile_cpp_command(self.working_dir.root, challenge.name, ["__SOURCE_NAME__"])
        arguments["--compiler-command"] = f'python3 {compile_cmd}'
        test_cmd = test_command(self.working_dir.root, challenge.name, test="__TEST_NAME__")
        arguments["--test-command"] = f'python3 {test_cmd}'
        arguments["--prefix"] = str(self.working_dir.cmake)

        pos_tests = challenge.pos_tests
        neg_tests = challenge.neg_tests

        if self.pos_tests and self.pos_tests <= pos_tests:
            pos_tests = self.pos_tests

        if self.neg_tests and self.neg_tests <= neg_tests:
            neg_tests = self.neg_tests

        arguments["--pos-tests"] = str(pos_tests)
        arguments["--neg-tests"] = str(neg_tests)

        if challenge.multifile:
            manifest_path = self.write_manifest(challenge.manifest)
            arguments["--rep"] = "cilpatch"
            arguments["--program"] = manifest_path

        else:
            arguments["--rep"] = "c"
            arguments["--program"] = c_to_ccp(list(challenge.manifest.keys())[0])

        repair_cmd = [os.path.join(REPAIR_TOOLS_DIR, self.config["program"])]

        for opt, arg in arguments.items():
            if arg != "":
                repair_cmd.extend((opt, arg))
            else:
                repair_cmd.extend([opt])

        return repair_cmd


def init(args):
    return GenProg(config_path=args.config_path,
                   pos_tests=args.pos_tests,
                   neg_tests=args.neg_tests,
                   seed=args.seed)


def genprog_args(input_parser):
    input_parser.add_argument("--seed", help="The random seed", default=0, type=int)
    input_parser.add_argument("--pos_tests", help="Number of positive tests.", type=int, default=None)
    input_parser.add_argument("--neg_tests", help="Number of negative tests", type=int, default=None)
    input_parser.add_argument("--config_path", help="Path to the configuration file", type=str, required=True)
    input_parser.add_argument('--version', action='version', version='GenProg e720256')


parser = add_repair_tool("GenProg", init, 'Repair the challenge with GenProg')
genprog_args(parser)
