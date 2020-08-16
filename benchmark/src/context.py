#!/usr/bin/env python3

from config import Configuration, configuration
from utils.paths import *
from utils.challenges import get_metadata


class Context:
    def __init__(self, configs: Configuration):
        self.configuration = configs

    def __call__(self, challenge_name: str, working_directory: str):
        self.challenge_name = challenge_name
        self.challenge_metadata: dict = get_metadata(self.configuration.metadata, challenge_name)
        self.working_directory: WorkingDirectory = get_working_directory(working_directory, challenge_name)
        self.challenge_paths: ChallengePaths = get_challenge_paths(self.configuration, challenge_name)

    def get_benchmark_paths(self):
        return self.configuration.cb_paths

    def get_scripts(self):
        return self.configuration.cb_paths.scripts


context = Context(configuration)
