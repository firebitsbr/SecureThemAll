#!/usr/bin/env python3
from pathlib import Path
from typing import Tuple, Union

from config import Configuration
from .utils.command import Command
from .utils.stream import ColorPrint


class Setting:
    def __init__(self,
                 name: str,
                 config: Configuration,
                 verbose: bool = False,
                 timeout: int = None,
                 seed: int = 0,
                 **kwargs):
        self.name = name
        self.configuration = config
        self.verbose = verbose
        self.timeout = timeout if timeout else config.command_timeout
        self.log_file = None
        self.seed = seed

        if kwargs:
            self._log(f"{name}: unknown arguments {kwargs}\n.")

    def __call__(self,
                 cmd_str: str,
                 exit_err: bool = False,
                 cmd_cwd: str = None,
                 timeout: int = None,
                 msg: str = None) -> Tuple[Union[str, None], Union[str, None]]:
        if msg:
            print(msg)
            if self.verbose:
                print(cmd_str)

        self._log(msg)
        self._log(f"Command: {cmd_str}\n")

        cmd = Command(cmd_str, cwd=cmd_cwd)
        out, err = cmd(verbose=self.verbose,
                       timeout=timeout if timeout else self.timeout,
                       exit_err=exit_err,
                       file=self.log_file)
        if err:
            ColorPrint.print_fail(err)

        return out, err

    def get_repair_tools_path(self):
        return self.configuration.paths.repair_tools

    def _init_log_file(self, folder: Path, file: Path, parents: bool = True, exists_ok: bool = True):
        self.log_dir = self.configuration.paths.log_dir / folder
        self.log_file = self.log_dir / file

        if not self.log_dir.exists():
            self.log_dir.mkdir(parents=parents, exist_ok=exists_ok)

    def status(self, message: str, err: bool = False, bold: bool = False, ok: bool = False, warn: bool = False):
        if ok:
            ColorPrint.print_pass(message)
        elif err:
            ColorPrint.print_fail(message)
        elif bold:
            ColorPrint.print_bold(message)
        elif warn:
            ColorPrint.print_warn(message)
        else:
            ColorPrint.print_info(message)

        self._log(message)

    def _log(self, msg: str):
        if self.log_file and msg:
            with self.log_file.open(mode="a") as lf:
                lf.write(msg)
