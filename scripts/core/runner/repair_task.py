#!/usr/bin/env python3

# from: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/runner/RepairTask.py

import time
from pathlib import Path
from typing import Tuple, Union

from core.repair_tool import RepairTool
from core.benchmark import Benchmark
from ..utils.command import Command


class RepairTask(object):

    def __init__(self,
                 tool: RepairTool,
                 benchmark: Benchmark,
                 out_dir: Path,
                 challenge_name: str,
                 timeout: int,
                 verbose: bool = False):
        """"
        :type tool: RepairTool
        :type benchmark: Benchmark
        :type out_dir: Path
        :type challenge_name: str
        :type timeout: int
        :type verbose: bool
        """
        self.tool = tool
        self.challenge = challenge_name
        self.benchmark = benchmark
        self.timeout = int(timeout)
        self.verbose = verbose
        self.log_dir = out_dir / Path(self.challenge, self.tool.name, str(self.tool.seed))
        self.log_file = self.log_dir / Path("repair.log")

        if not self.log_dir.exists():
            self.log_dir.mkdir(parents=True, exist_ok=True)

        self.status = None
        self.id = None
        self.results = None
        self.starting_date = None
        self.end_date = None

    def __call__(self,
                 cmd_str: str,
                 exit_err: bool = False,
                 cmd_cwd: str = None,
                 msg: str = None) -> Tuple[Union[str, None], Union[str, None]]:
        if msg:
            print(msg)
            if self.verbose:
                print(cmd_str)

        self._log(msg)
        self._log(f"Command: {cmd_str}\n")

        cmd = Command(cmd_str, cwd=cmd_cwd)
        out, err = cmd(verbose=self.verbose,
                       timeout=self.timeout,
                       exit_err=exit_err,
                       file=self.log_file)
        return out, err

    def run(self):
        self.starting_date = time.time()
        return self.tool.repair(self)

    def _log(self, msg: str):
        if msg:
            with self.log_file.open(mode="a") as lf:
                lf.write(msg)
