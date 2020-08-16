#!/usr/bin/env python3

from json import loads
from .exceptions import InitializationException, ChallengeNotFound, TestNotFound
from .paths import get_challenge_paths
from pathlib import Path
from typing import List


def get_coverage(challenges_path: Path):
    with challenges_path.open(mode="r") as cp:
        challenges = cp.read().split("\n")
        return challenges[:-1]


def get_metadata(metadata_path: Path, challenge_name: str = None):
    if not metadata_path.exists():
        raise InitializationException(
            "Metadata file not found. Initialize framework with python3 benchmark/cb_multios_apr.py -t metadata")

    with metadata_path.open(mode="r") as json_file:
        metadata = loads(json_file.read())

        if challenge_name:
            if challenge_name not in metadata:
                raise ChallengeNotFound("No such challenge")
            return metadata[challenge_name]

        return metadata


def get_test(challenge_metadata: dict, build_path: Path, polls_path: Path, test: str):
    tests = challenge_metadata["tests"]["cases"]

    if test not in tests:
        raise TestNotFound(f"No such test for challenge.")

    is_pov = (test[0] == 'n')
    test_path = Path(tests[test])
    if is_pov:
        return build_path / test_path, is_pov

    return polls_path / test_path, is_pov


def map_instrumented_files(challenge_manifest: dict, instrumented_files: List[str]):
    mapping = {}

    for file in challenge_manifest.keys():
        cpp_file = file.replace('.c', '.i')
        for inst_file in instrumented_files:
            if cpp_file in inst_file:
                mapping[file] = inst_file
                break

    return mapping


def get_compile_command(manifest_file: str, compile_commands: dict, instrumented_file: str):
    for command_entry in compile_commands:
        if command_entry["file"].endswith(manifest_file):
            command = command_entry["command"]
            source_file = command_entry["file"]
            modified_command = command.replace(source_file, instrumented_file)
            modified_command = modified_command.replace('-save-temps=obj', '')

            return modified_command

    return None


def get_info(configs, challenge_name: str):
    paths = get_challenge_paths(configs, challenge_name)

    with paths.info.open(mode="r") as f:
        return f.read()
