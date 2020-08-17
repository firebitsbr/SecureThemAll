#!/usr/bin/env python3
import subprocess
from typing import IO
from .streams import print_err


class Command:
    def __init__(self, command, cwd: str = None):
        if isinstance(command, str):
            self.shell = True
        elif isinstance(command, list):
            self.shell = False
        else:
            raise ValueError("Command must be a string or a list.")

        self.command = command
        self.cwd = cwd

    def _exec_timeout(self, proc: subprocess.Popen, timeout: int):
        try:
            out, err = proc.communicate(timeout=timeout)
        except subprocess.TimeoutExpired:
            proc.kill()
            out, err = proc.communicate()

        if isinstance(out, bytes):
            out = out.decode()

        if isinstance(err, bytes):
            err = err.decode()

        if self.verbose:
            print(out)

            if err:
                print(err)

        if self.file:
            self.file.write(out)

            if err:
                self.file.write(err)

        return out, err

    def _exec(self, proc: subprocess.Popen):
        out = []
        err = None

        for line in proc.stdout:
            decoded = line.decode()
            out += decoded

            if self.verbose:
                print(decoded)

            if self.file:
                self.file.write(decoded)

        if proc.returncode and proc.returncode != 0:
            proc.kill()
            err = proc.stderr.read().decode()

            if self.verbose:
                print(err)

            if self.file and err:
                self.file.write(err)

        return ''.join(out), err

    def __call__(self, verbose: bool = False, timeout: int = None, exit_err: bool = False, file: IO = None):
        self.verbose = verbose
        self.file = file

        # based on https://stackoverflow.com/a/28319191
        with subprocess.Popen(args=self.command,
                              shell=self.shell,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              cwd=self.cwd) as proc:
            if timeout:
                out, err = self._exec_timeout(proc, timeout)
            else:
                out, err = self._exec(proc)

            if exit_err and err:
                print_err(err)
                exit(proc.returncode)

            return out, err

