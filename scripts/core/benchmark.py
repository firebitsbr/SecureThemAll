#!/usr/bin/env python3

import shutil

from pathlib import Path
from typing import List

from core.challenge import Challenge
from core.setting import Setting
from .utils.lock_file import LockFile


class Benchmark(Setting):
    """Benchmark"""

    def __init__(self, debug: bool = False, **kwargs):
        super(Benchmark, self).__init__(name="Benchmark", **kwargs)
        self.paths = self.configuration.bench_paths
        self.challenges = None
        self.verbose = True
        self.debug = debug
        self._init_log_file(folder=Path("benchmark", str(self.seed)),
                            file=Path("benchmark.log"))
        self.get_challenges()

    def _get_challenge_info(self, name):
        challenge = self.get_challenge(name)

        if challenge is not None:
            return challenge.get_info()

        return None

    def init_challenge(self, tool_name: str, challenge_name: str, remove_patch: bool = False) -> Challenge:
        wd = Path(self.configuration.paths.working_dir, f"{tool_name}_{challenge_name}_{self.seed}")
        lock = LockFile(self.configuration.paths.root, self.configuration.lock_file)
        cmd_str = self.checkout(working_directory=wd, challenge_name=challenge_name, remove_patch=remove_patch)

        if wd.exists():
            shutil.rmtree(wd)
        try:
            lock.wait_lock()
            lock()
            out, err = super().__call__(cmd_str=cmd_str,
                                        msg=f"Checking out challenge {challenge_name} to {wd}.\n")
        finally:
            lock.unlock()

        if not err:
            return Challenge(challenge_name, wd)

        return Challenge("", "")

    def get_challenges(self):
        if not self.challenges:
            out, err = super().__call__(cmd_str=f"{self.paths.program} catalog",
                                        msg="Querying benchmarks challenges")

            self.challenges = out.splitlines()

        return self.challenges

    def checkout(self, working_directory: Path, challenge_name: str, remove_patch: bool = False) -> Challenge:
        cmd_str = f"{self.paths.program} checkout -wd {working_directory} -cn {challenge_name}"

        if self.debug:
            cmd_str += " -v"

        if remove_patch:
            cmd_str += " -rp"

        return cmd_str

    def compile(self, challenge: Challenge, instrumented_files: List[str] = None, preprocess=False, regex: str = None,
                prefix: str = None, log_file: str = None, fix_files: List[str] = None, cpp_files: bool = False,
                separate: bool = False):
        cmd_str = f"{self.paths.program} compile -wd {challenge.working_dir} -cn {challenge.name}"
        cmd_flags = ""

        if instrumented_files:
            inst_files_str = ' '.join(instrumented_files)
            cmd_flags += f" -ifs {inst_files_str}"

        if fix_files:
            fix_files_str = ' '.join(fix_files)
            cmd_flags += f" -ffs {fix_files_str}"

        if cpp_files:
            cmd_flags += f" -cpp"

        if regex:
            cmd_flags += f" -r {regex}"

        if prefix:
            cmd_flags += f" -pf {prefix}"

        if log_file:
            cmd_flags += f" -l {log_file}"

        if self.debug:
            cmd_str += " -v"

        if preprocess:
            out, err = super().__call__(cmd_str=cmd_str + cmd_flags,
                                        msg=f"Compiling {challenge.name}.\n")

            if out:
                return out
            return err

        if separate:
            return cmd_str, cmd_flags

        return cmd_str + cmd_flags

    def test(self, challenge: Challenge, tests: List[str] = None, pos_tests: bool = False, neg_tests: bool = False,
             exit_fail: bool = False, write_fail: bool = False, out_file: str = None, coverage: dict = None,
             regex: str = None, prefix: str = None, log_file: str = None, neg_pov: bool = False):
        cmd_str = f"{self.paths.program} test -wd {challenge.working_dir} -cn {challenge.name}"

        if tests:
            tests_str = ' '.join(tests)
            cmd_str += f" -tn {tests_str}"
        elif pos_tests:
            cmd_str += " --pos_tests"
        elif neg_tests:
            cmd_str += " --neg_tests"

        if exit_fail:
            cmd_str += " -ef"

        if write_fail:
            cmd_str += " -wf"

        if neg_pov:
            cmd_str += " -np"

        if out_file:
            cmd_str += f" -of {out_file}"

        if regex:
            cmd_str += f" -r {regex}"

        if prefix:
            cmd_str += f" -pf {prefix}"

        if log_file:
            cmd_str += f" -l {log_file}"

        if self.debug:
            cmd_str += " -v"

        if coverage:
            cmd_str += " " + ' '.join([f"--{opt} {arg}" for opt, arg in coverage.items()])
            out, err = super().__call__(cmd_str=cmd_str, msg=f"Testing {challenge.name}.\n")

            if out:
                return out
            return err

        return cmd_str

    def prefix(self, challenge: Challenge):
        out, err = super().__call__(
            cmd_str=f"{self.paths.program} info -t prefix -wd {challenge.working_dir} -cn {challenge.name}",
            msg=f"Querying {challenge.name}'s prefix.\n")

        if not err:
            return out.splitlines()[0]

        return ""

    def patch(self, challenge_name: str):
        out, err = super().__call__(cmd_str=f"{self.paths.program} patch -cn {challenge_name}")

        if err:
            return ""

        return out

    def count_tests(self, challenge: Challenge):
        out, err = super().__call__(cmd_str=f"{self.paths.program} info -t count_tests -wd {challenge.working_dir} " +
                                            f"-cn {challenge.name}",
                                    msg=f"Querying {challenge.name}'s tests count.\n")

        if not err:
            return out.splitlines()[0].split(" ")

        return 0, 0
