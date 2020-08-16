#!/usr/bin/env python3
from dataclasses import dataclass
from os.path import dirname, abspath
from pathlib import Path

ROOT_DIR = dirname(dirname(__file__))
SOURCE_DIR = dirname(abspath(__file__))


@dataclass
class Scripts:
    build: Path
    genpolls: Path

    def validate(self):
        return self.build.exists() and self.genpolls.exists()


@dataclass
class CBMultiOSPaths:
    root: Path
    build: Path
    tools: Path
    polls: Path
    challenges: Path
    scripts: Scripts

    def validate(self):
        return self.root.exists() and self.build.exists() \
               and self.tools.exists() and self.polls.exists() \
               and self.challenges.exists() and self.scripts.validate()


@dataclass
class Configuration:
    src: Path
    cb_paths: CBMultiOSPaths
    metadata: Path
    challenges: Path
    tests_timeout: str  # In seconds

    def validate(self):
        return self.src.exists() and self.cb_paths.validate() \
                and self.metadata.exists() and self.challenges.exists()


cb_multios_path = Path(ROOT_DIR) / Path("cb-multios")

configuration = Configuration(
        Path(ROOT_DIR) / Path(SOURCE_DIR),
        CBMultiOSPaths(
            cb_multios_path,
            cb_multios_path / Path("build"),
            cb_multios_path / Path("tools"),
            cb_multios_path / Path("polls"),
            cb_multios_path / Path("challenges"),
            Scripts(
                cb_multios_path / Path("checkout.sh"),
                cb_multios_path / Path("genpolls.sh")
            )
        ),
        Path(ROOT_DIR) / Path("metadata.json"),
        Path(ROOT_DIR) / Path("linux-final.txt"),
        "10"
    )
