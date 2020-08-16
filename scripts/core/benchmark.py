#!/usr/bin/env python3

from core.challenge import Challenge
from benchmark.src.utils.challenges import get_challenge_paths
from benchmark.src.config import configuration

class Benchmark(object):
    """Benchmark"""

    def __init__(self, name: str, metadata: dict):
        self.name = name
        self.metadata = metadata
        self.challenges = None
        self.get_challenges()

    def _get_challenge_info(self, name):
        challenge = self.get_challenge(name)

        if challenge is not None:
            return challenge.get_info()

        return None

    def get_challenge(self, name):
        if self.challenges is not None and name in self.challenges:
            return self.challenges[name]
        return None

    def get_challenges(self):
        if self.challenges is not None:
            return self.challenges

        self.challenges = {}

        for challenge_name, data in self.metadata.items():
            challenge_paths = get_challenge_paths(configuration, challenge_name)
            challenge = Challenge(challenge_name, challenge_paths, data)
            self.challenges[challenge_name] = challenge

        return self.challenges

    def __str__(self):
        return self.name
