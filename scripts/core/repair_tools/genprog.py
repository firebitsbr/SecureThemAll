import re
from pathlib import Path
from typing import List

from core.input_parser import add_repair_tool
from core.repair_tool import RepairTool
from core.runner.repair_task import RepairTask


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

            self.end()

            for file_path in challenge.manifest(preprocessed=True):
                self._get_patches(challenge.working_dir, file_path, challenge.working_dir)

            return out

        finally:
            repair_task.status = repair_task.results(self.repair_begin, self.repair_end, self.patches)
            repair_task.results.write()
            rm_cmd = f"rm -rf {challenge.working_dir}"
            # super().__call__(cmd_str=rm_cmd)

    def _get_patches(self, prefix: Path, target_file: Path, edits_path: Path):
        target_file_str = str(target_file)
        patch = {"target_file": target_file_str, "fix": "", "edits": []}

        repaired_file = prefix / Path("repair") / target_file
        sanity_file = prefix / Path("sanity") / target_file

        if sanity_file.exists():
            if repaired_file.exists():
                diff = self.diff(path=sanity_file, path_compare=repaired_file)
                patch['fix'] = diff
            else:
                patch['fix'] = "no repair found"
            if edits_path.exists():
                for f in edits_path.iterdir():
                    if f.is_dir() and re.match(r"^\d{6}$", str(f.name)):
                        edit_file = f / target_file
                        if not edit_file.is_dir() and edit_file.stat().st_size > 0:
                            diff = self.diff(path=sanity_file, path_compare=edit_file)
                            patch['edits'].append(diff)

        self.patches.append(patch)

    def write_manifest(self, manifest_files: List[Path], out_path: Path):
        with out_path.open(mode="w") as op:
            for file in manifest_files:
                op.write(f"{file}\n")

    def _get_repair_cmd(self, benchmark, challenge):
        arguments = self.repair_config["arguments"]
        prefix = benchmark.prefix(challenge)
        arguments["--compiler-command"] = benchmark.compile(challenge, fix_files=["__SOURCE_NAME__"],
                                                            instrumented_files=[str(file) for file in
                                                                                challenge.manifest(prefix=prefix,
                                                                                                   preprocessed=True)],
                                                            cpp_files=True)
        arguments["--test-command"] = benchmark.test(challenge, tests=["__TEST_NAME__"], exit_fail=True, neg_pov=True)
        arguments["--prefix"] = prefix

        pos_tests, neg_tests = benchmark.count_tests(challenge)
        if int(pos_tests) > 100:
            raise ValueError("Too many tests")
        if int(neg_tests) == 0:
            raise ValueError("No negative tests")
        arguments["--pos-tests"] = str(pos_tests)
        arguments["--neg-tests"] = str(neg_tests)
        arguments["--rep"] = "cilpatch" if challenge.manifest.multi_file else "c"
        manifest_file = challenge.working_dir / Path('gen_prog_manifest.txt')
        self.write_manifest(challenge.manifest(preprocessed=True), manifest_file)
        arguments["--program"] = str(manifest_file)

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
