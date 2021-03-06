import json
import re
from pathlib import Path

from core.input_parser import add_repair_tool
from core.repair_tool import RepairTool
from core.runner.repair_task import RepairTask


class CquenceR(RepairTool):
    """CquenceR"""

    def __init__(self, **kwargs):
        super(CquenceR, self).__init__(name="CquenceR", **kwargs)

    def repair(self, repair_task: RepairTask):
        """"
        :type repair_task: RepairTask
        """
        # checkouts the challenge binary to a temporary path
        benchmark = repair_task.benchmark
        challenge = benchmark.init_challenge(self.name, challenge_name=repair_task.challenge, remove_patch=True)
        benchmark.compile(challenge, preprocess=True)
        self._init_log_file(folder=Path(self.name, challenge.name), file=Path(f"tool_{self.seed}.log"))

        try:
            repair_cmd = self._get_repair_cmd(benchmark=benchmark, challenge=challenge)
            self.begin()
            self.output, self.error = super().__call__(cmd_str=repair_cmd,
                                                       cmd_cwd=str(challenge.working_dir))

            self.end()

            for file_path in challenge.manifest():
                self._get_patches(challenge.working_dir, file_path, challenge.source)

            return self.output

        finally:
            repair_task.status = self.repair_status()
            self.save(working_dir=challenge.working_dir, challenge_name=challenge.name)
            # self.dispose(challenge.working_dir)

    def _get_patches(self, working_dir: Path, target_file: Path, source_path: Path):
        target_file_str = str(target_file)
        patch = {"target_file": target_file_str, "fix": "", "edits": []}

        repaired_file = working_dir / Path("repair") / target_file
        baseline_file = source_path / target_file
        edits_path = working_dir / Path('patches')

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

    def write_manifest(self, vuln_file: Path, out_path: Path):
        with vuln_file.open(mode="r") as vf, out_path.open(mode="w") as op:
            for file, hunk in json.load(vf).items():
                hunks = ""
                for start, lines in hunk.items():
                    hunks += f"{start},{int(start) + len(lines)};"
                op.write(f"{file}: {hunks}\n")

    def _get_repair_cmd(self, benchmark, challenge):
        arguments = self.tool_configs["arguments"]
        prefix = challenge.working_dir / Path(challenge.name)
        cmp_cmd, cmp_args = benchmark.compile(challenge, fix_files=["__SOURCE_NAME__"], separate=True,
                                              instrumented_files=[str(file) for file in challenge.manifest(prefix=prefix)])
        arguments["--compile_script"] = cmp_cmd
        arguments["--compile_args"] = cmp_args
        arguments["--test_script"] = benchmark.test(challenge, tests=["__TEST_NAME__"], exit_fail=True, neg_pov=True)
        arguments["--working_dir"] = str(challenge.working_dir)
        arguments["--prefix"] = str(prefix)
        arguments["--seed"] = str(self.seed)
        arguments["--verbose"] = ''
        manifest_file = challenge.working_dir / Path('hunk_manifest')
        self.write_manifest(challenge.vuln, manifest_file)
        arguments["--manifest_path"] = str(manifest_file)

        pos_tests, neg_tests = benchmark.count_tests(challenge)

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
