import re
from pathlib import Path
from typing import List

from core.input_parser import add_repair_tool
from core.repair_tool import RepairTool
from core.runner.repair_task import RepairTask


def parse_output(results: str):
    stats = {"comps": 0, "failed_comps": 0, "passed_tests": 0, "failed_tests": 0}

    if not results:
        return stats

    match_queries = re.search(r"Variant Test Case Queries: (\d+)", results)
    match_comp_fails = re.search(r"Compile Failures: (\d+)", results)
    match_comp_count = re.search(r"\s+compile\s+(\d+)", results)
    match_test_count = re.search(r"\s+test\s+(\d+)", results)

    if match_queries:
        stats["passed_tests"] = int(match_queries.group(1))
    if match_comp_fails:
        stats["failed_comps"] = int(match_comp_fails.group(1))
    if match_comp_count:
        stats["comps"] = int(match_comp_count.group(1)) - stats["failed_comps"]
    if match_test_count:
        stats["failed_tests"] = int(match_test_count.group(1)) - stats["passed_tests"]

    return stats


class GenProg(RepairTool):
    """GenProg"""

    def __init__(self, **kwargs):
        super(GenProg, self).__init__(name="GenProg", **kwargs)

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
            self.output, self.error = super().__call__(cmd_str=repair_cmd,
                                                       cmd_cwd=str(challenge.working_dir))

            self.end()

            for file_path in challenge.manifest(preprocessed=True):
                self._get_patches(challenge.working_dir, file_path, challenge.working_dir)

            return self.output

        finally:
            repair_task.status = self.status()
            self.save(parse_output_func=parse_output, challenge_name=challenge.name)
            # self.dispose(challenge.working_dir)

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
        arguments = self.tool_configs["arguments"]
        prefix = benchmark.prefix(challenge)
        arguments["--compiler-command"] = benchmark.compile(challenge, fix_files=["__SOURCE_NAME__"],
                                                            instrumented_files=[str(file) for file in
                                                                                challenge.manifest(prefix=prefix,
                                                                                                   preprocessed=True)],
                                                            cpp_files=True)
        arguments["--test-command"] = benchmark.test(challenge, tests=["__TEST_NAME__"], exit_fail=True, neg_pov=True)
        arguments["--prefix"] = prefix

        pos_tests, neg_tests = benchmark.count_tests(challenge)

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
