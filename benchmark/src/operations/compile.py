#!/usr/bin/env python3

from operation import Operation
from utils.command import Command
from utils.challenges import map_instrumented_files, get_compile_command
from json import loads
from pathlib import Path
from typing import List
from input_parser import add_operation
from context import Context


class Compile(Operation):
    def __init__(self, name: str,
                 context: Context,
                 inst_files: List[str]):
        super().__init__(name, context)
        self.inst_files = inst_files

    def __call__(self):
        if self.inst_files:
            print(f"Compiling {self.context.challenge_name}.")
            link_file = self.context.working_directory.cmake / Path("link.txt")

            # compile the preprocessed file to object
            with self.context.working_directory.command.open(mode="r") as json_file:
                compile_commands = loads(json_file.read())
                manifest: dict = self.context.challenge_metadata["manifest"]

                mapping = map_instrumented_files(manifest, self.inst_files)
                wd_build = self.context.working_directory.build.absolute()

                for source_file, cpp_file in mapping.items():
                    compile_command = get_compile_command(source_file, compile_commands, cpp_file)
                    cmd = Command(compile_command, cwd=wd_build)
                    cmd(verbose=True, exit_err=True)

            # link objects into executable
            link_cmd_str = f"cmake -E cmake_link_script {link_file} {self.context.challenge_name}"
            cmd = Command(link_cmd_str, cwd=wd_build)
            cmd(verbose=True, exit_err=True)

    def __str__(self):
        if self.inst_files:
            return super().__str__() + f" -ifs {' '.join(self.inst_files)}"
        return super().__str__()


def compile_args(input_parser):
    input_parser.add_argument('-ifs', '--inst_files', nargs='+', help='Instrumented files to compile.', default=None)


c_parser = add_operation("compile", Compile, 'Compiles challenge binary.')
compile_args(c_parser)
