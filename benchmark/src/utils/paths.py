#!/usr/bin/env python3

from dataclasses import dataclass
from pathlib import Path


@dataclass
class WorkingDirectory:
    root: Path
    build: Path
    cmake: Path
    command: Path


def get_working_directory(working_directory: str, challenge_name: str):
    wd = Path(working_directory)
    build = wd / Path("challenges") / Path(challenge_name)
    cmake = build / Path("CMakeFiles") / Path(f"{challenge_name}.dir")
    command = wd / Path('compile_commands.json')

    return WorkingDirectory(wd, build, cmake, command)


@dataclass
class ChallengePaths:
    name: str
    source: Path
    build: Path
    info: Path
    polls: Path
    cmake: Path


def get_challenge_paths(configs, challenge_name):
    source = configs.cb_paths.challenges / Path(challenge_name)
    build = configs.cb_paths.build / Path("challenges") / Path(challenge_name)
    readme = source / Path("README.md")
    polls = configs.cb_paths.polls / Path(challenge_name) / Path('poller') / Path('for-release')
    cmake = build / Path("CMakeFiles") / Path(f"{challenge_name}.dir")

    return ChallengePaths(challenge_name, source, build, readme, polls, cmake)

