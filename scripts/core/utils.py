#!/usr/bin/env python3
import re

from benchmark.src.utils.challenges import get_metadata
from benchmark.src.config import SOURCE_DIR
from scripts.config import BENCHMARK_DIR
from core.benchmark import Benchmark
from typing import List

from pathlib import Path
#EXCLUDE = ["libpov", "include"]

'''
def get_compile_commands():
    compile_commands_file = os.path.join(CB_DIR, 'build', 'compile_commands.json')
    
    with open (compile_commands_file, "r") as json_file:
        compile_commands = json.loads(json_file.read())

    mapping = {}

    for command in compile_commands:
        challenge = command["directory"].split("/")[-1]
        file = command["file"].split(challenge+"/")[-1]

        if "pov" in file or "_patched" in command["command"] or challenge in EXCLUDE:
            continue

        if challenge in mapping:
            mapping[challenge][file] = command["command"]
        else:
            mapping[challenge] = {file: command["command"]}

    return mapping
'''


def get_benchmark():
    metadata = get_metadata(Path(BENCHMARK_DIR) / Path("metadata.json"))

    return Benchmark("CB-MultiOS", metadata)


def c_to_ccp(c_file):
    return re.sub(r'.c$', '.i', c_file)


def ccp_to_c(ccp_file):
    return re.sub(r'.i$', '.c', ccp_file)


def ccp_to_obj(ccp_file):
    return re.sub(r'.i$', '.c.o', ccp_file)


def checkout_command(working_directory: str, challenge_name: str):
    return f"{SOURCE_DIR}/cb_multios.py checkout -wd {working_directory} -cn {challenge_name}".split()


def test_command(working_directory: str, challenge_name: str, test: str):
    return f"{SOURCE_DIR}/cb_multios.py test -wd {working_directory} -cn {challenge_name} -t {test}"


def compile_cpp_command(working_directory: str, challenge_name: str, instrumented_files: List[str]):
    inst_files_str = ' '.join(instrumented_files)
    return f"{SOURCE_DIR}/cb_multios.py compile -wd {working_directory} -cn {challenge_name} -ifs {inst_files_str}"
