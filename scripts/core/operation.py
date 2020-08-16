#!/usr/bin/env python3

from benchmark.src.utils.command import Command
from scripts.core.utils import compile_cpp_command, test_command, checkout_command


class Operation:
    def __init__(self, name: str, operation_cmd: str):
        self.name = name
        self.cmd = Command(operation_cmd)

    def __call__(self):
        return self.cmd()

    def __str__(self):
        return self.name


class CompilePreProcessed(Operation):
    def __init__(self, wd, cn, ifs):
        ccpp_cmd = compile_cpp_command(wd, cn, ifs)
        super().__init__("Compile preprocessed", ccpp_cmd)


class Test(Operation):
    def __init__(self, wd, cn, t):
        test_cmd = test_command(wd, cn, t)
        super().__init__("Test", test_cmd)


class Checkout(Operation):
    def __init__(self, wd, cn):
        co_cmd = checkout_command(wd, cn)
        super().__init__("Checkout", co_cmd)
