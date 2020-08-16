#!/usr/bin/env python3

from operation import Operation
from utils.command import Command
from utils.challenges import get_test
from utils.parse import parse_results
from input_parser import add_operation

from context import Context
from os import listdir
from pathlib import Path


class Test(Operation):
    def __init__(self,
                 name: str,
                 context: Context,
                 test_name: str):
        super().__init__(name, context)
        self.test_name = test_name
        self.test_file, self.is_pov = get_test(self.context.challenge_metadata,
                                               self.context.working_directory.build,
                                               self.context.challenge_paths.polls,
                                               test_name)

    def __call__(self):
        print(f"Testing {self.context.challenge_name} on {self.test_file}")
        # Collect the names of binaries to be tested
        cb_dirs = [el for el in listdir(str(self.context.working_directory.build)) if el.startswith('cb_')]

        if len(cb_dirs) > 0:
            # There are multiple binaries in this challenge
            bin_names = ['{}_{}'.format(self.context.challenge_name, i + 1) for i in range(len(cb_dirs))]
        else:
            bin_names = [self.context.challenge_name]

        tools_dir = self.context.get_benchmark_paths().tools

        cb_cmd = [str(tools_dir.absolute() / Path('cb-test.py')),
                  '--directory', self.context.working_directory.build.absolute(),
                  '--xml', self.test_file.absolute(),
                  '--concurrent', '2',
                  '--timeout', self.context.configuration.tests_timeout,
                  '--negotiate_seed', '--cb'] + bin_names

        if self.is_pov:
            cb_cmd += ['--should_core']

        cmd = Command(cb_cmd, cwd=tools_dir.absolute())
        out, _ = cmd(exit_err=True, timeout=int(self.context.configuration.tests_timeout))
        total, passed = parse_results(out.decode(), self.is_pov)

        if passed == '0':
            exit(1)

        exit(0)

    def __str__(self):
        return super().__str__() + f" -t {self.test_file}"


def test_args(input_parser):
    input_parser.add_argument('-tn', '--test_name', type=str, help='Name of the test')


t_parser = add_operation("test", Test, 'Runs specified test against challenge binary.')
test_args(t_parser)
