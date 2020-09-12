#!/usr/bin/env python3

from pathlib import Path
from typing import List, Tuple, Union

from core.challenge import Challenge
from .utils.paths import BenchPaths
from .utils.command import Command


class Benchmark(object):
    """Benchmark"""

    def __init__(self, paths: BenchPaths, out_dir: Path, tool_name: str, tool_seed: int):
        self.paths = paths
        self.challenges = None
        print(tool_name, tool_seed)
        self.log_dir = out_dir / Path("benchmark", tool_name, str(tool_seed))
        self.log_file = self.log_dir / Path("benchmark.log")

        if not self.log_dir.exists():
            self.log_dir.mkdir(parents=True, exist_ok=True)

        self.get_challenges()

    def __call__(self,
                 cmd_str: str,
                 cmd_cwd: str = None,
                 verbose: bool = False,
                 msg: str = None) -> Tuple[Union[str, None], Union[str, None]]:
        if msg:
            print(msg)

        print(cmd_str)

        self._log(msg)
        self._log(f"Command: {cmd_str}\n")

        cmd = Command(cmd_str, cwd=cmd_cwd)

        out, err = cmd(verbose=verbose,
                       exit_err=False,
                       file=self.log_file)

        if err:
            self._log(f"Benchmark Error:\n{err}\n")

        return out, err

    def _get_challenge_info(self, name):
        challenge = self.get_challenge(name)

        if challenge is not None:
            return challenge.get_info()

        return None

    def get_challenge(self, name):
        if self.challenges and name in self.challenges:
            return self.challenges.get(name)
        return None

    def get_challenges(self):
        if not self.challenges:
            out, err = self(cmd_str=f"{self.paths.program} catalog",
                            msg="Querying benchmarks challenges")

            self.challenges = out.splitlines()

        return self.challenges

    def checkout(self, working_directory: str, challenge_name: str) -> Challenge:
        out, err = self(cmd_str=f"{self.paths.program} checkout -wd {working_directory} -cn {challenge_name}",
                        msg=f"Checking out challenge {challenge_name} to {working_directory}.\n",
                        verbose=True)

        if not err:
            return Challenge(challenge_name, working_directory)
        self._log(err)
        return Challenge("", "")

    def compile(self, challenge: Challenge, instrumented_files: List[str] = None, preprocessed=False):
        cmd_str = f"{self.paths.program} compile -wd {challenge.working_dir} -cn {challenge.name} --log_file bench.log "

        if instrumented_files:
            inst_files_str = ' '.join(instrumented_files)
            cmd_str += f" -ifs {inst_files_str}"

        if preprocessed:
            out, err = self(cmd_str=cmd_str,
                            msg=f"Compiling {challenge.name}.\n",
                            verbose=True)

        return cmd_str

    def test(self, challenge: Challenge, tests: List[str] = None, pos_tests: bool = False, neg_tests: bool = False,
             exit_fail=False):
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

        return cmd_str

    def prefix(self, challenge: Challenge):
        out, err = self(cmd_str=f"{self.paths.program} info -t prefix -wd {challenge.working_dir} -cn {challenge.name}",
                        msg=f"Querying {challenge.name}'s prefix.\n",
                        verbose=True)

        if not err:
            return out.splitlines()[0]

        return ""

    def count_tests(self, challenge: Challenge):
        out, err = self(cmd_str=f"{self.paths.program} info -t count_tests -wd {challenge.working_dir} " +
                                f"-cn {challenge.name}",
                        msg=f"Querying {challenge.name}'s tests count.\n",
                        verbose=True)

        if not err:
            return out.splitlines()[0].split(" ")

        return 0, 0

    def _log(self, msg: str):
        if msg:
            with self.log_file.open(mode="a") as lf:
                lf.write(msg)
