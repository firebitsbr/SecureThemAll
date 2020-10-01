import re
from pathlib import Path

from core.input_parser import add_repair_tool
from core.repair_tool import RepairTool
from core.runner.repair_task import RepairTask


class CquenceR(RepairTool):
    """CquenceR"""

    def __init__(self, pos_tests: int, neg_tests: int, **kwargs):
        super(CquenceR, self).__init__(name="CquenceR", **kwargs)
        self.pos_tests = pos_tests
        self.neg_tests = neg_tests

    def repair(self, repair_task: RepairTask):
        """"
        :type repair_task: RepairTask
        """
        # checkouts the challenge binary to a temporary path
        benchmark = repair_task.benchmark
        challenge = benchmark.init_challenge(self.name, challenge_name=repair_task.challenge, remove_patch=True,
                                             vuln_lines=True)
        benchmark.compile(challenge, preprocess=True)

        self._init_log_file(folder=Path(self.name, challenge.name, str(self.seed)),
                            file=Path("tool.log"))

        try:
            repair_cmd = self._get_repair_cmd(benchmark=benchmark, challenge=challenge)
            self.begin()
            out, err = super().__call__(cmd_str=repair_cmd,
                                        cmd_cwd=str(challenge.working_dir))

            self.end()

            for file_path in challenge.manifest():
                self._get_patches(challenge.source, Path(challenge.name) / file_path, challenge.working_dir)

            return out

        finally:
            repair_task.status = repair_task.results(self.repair_begin, self.repair_end, self.patches)
            repair_task.results.write()
            rm_cmd = f"rm -rf {challenge.working_dir}"
            #super().__call__(cmd_str=rm_cmd)

    def _get_patches(self, prefix: Path, target_file: Path, edits_path: Path):
        target_file_str = str(target_file)
        patch = {"target_file": target_file_str, "fix": "", "edits": []}

        repaired_file = edits_path / Path("repair") / target_file
        baseline_file = edits_path / target_file

        if repaired_file.exists():
            diff = self.diff(path=baseline_file, path_compare=repaired_file)
            patch['fix'] = diff
        else:
            patch['fix'] = "no repair found"

        if edits_path.exists():
            for f in edits_path.iterdir():
                if f.is_dir() and re.match(r"^\d{6}$", str(f.name)):
                    edit_file = f / target_file
                    if not edit_file.is_dir() and edit_file.stat().st_size > 0:
                        diff = self.diff(path=baseline_file, path_compare=edit_file)
                        patch['edits'].append(diff)

        self.patches.append(patch)

    def _get_repair_cmd(self, benchmark, challenge):
        arguments = self.repair_config["arguments"]
        prefix = benchmark.prefix(challenge)
        arguments["--compile_script"] = benchmark.compile(challenge, fix_files=["__SOURCE_NAME__"],
                                                          instrumented_files=[str(file) for file in challenge.manifest(prefix=prefix)])
        arguments["--test_script"] = benchmark.test(challenge, tests=["__TEST_NAME__"], exit_fail=True, neg_pov=True)
        arguments["--working_dir"] = str(challenge.working_dir)
        arguments["--src_path"] = challenge.name + '/' + str(challenge.manifest)
        arguments["--seed"] = str(self.seed)
        arguments["--verbose"] = ''
        arguments["--vuln_line"] = ';'.join([' '.join(vuln_lines) for vuln_lines in challenge.manifest.get_vuln_lines()])

        pos_tests, neg_tests = benchmark.count_tests(challenge)

        if int(pos_tests) > 100:
            raise ValueError("Too many tests")
        if int(neg_tests) == 0:
            raise ValueError("No negative tests")

        arguments["--pos_tests"] = str(pos_tests)
        arguments["--neg_tests"] = str(neg_tests)

        repair_cmd = [str(self.program)]

        for opt, arg in arguments.items():
            if arg != "":
                repair_cmd.extend((opt, arg))
            else:
                repair_cmd.extend([opt])

        return repair_cmd


def cquencer_args(input_parser):
    input_parser.add_argument('--version', action='version', version='1')


parser = add_repair_tool("CquenceR", CquenceR, 'Repair the challenge with CquenceR')
cquencer_args(parser)
