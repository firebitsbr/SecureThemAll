#!/usr/bin/env python3

from input_parser import add_operation
from operation import Operation
from utils.command import Command


class Checkout(Operation):
    def __call__(self):
        print(f"Checking out {self.context.challenge_name} to {self.context.working_directory.root}.")

        build_script = self.context.get_scripts().build
        cmd_str = f"{build_script} {self.context.working_directory.root} {self.context.challenge_name}"
        cmd = Command(cmd_str)
        cmd(verbose=True, exit_err=True)


def checkout_args(input_parser):
    pass


co_parser = add_operation("checkout", Checkout, 'Checks out challenge to working directory.')
checkout_args(co_parser)
