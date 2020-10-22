import json
from pathlib import Path

from core.utils.stats import Stats
from core.utils.metrics import Metrics


class ChallengeResults:
    def __init__(self, path: Path, timeout: int, patch: str):
        self.path = path

        if not self.path.exists():
            self.results = {}
            self.stats = Stats()
        else:
            with self.path.open(mode="r") as p:
                self.results = json.load(p)

            patches = self.results['patches']
            fix = patches[0]['fix'] if patches[0]['fix'] and patches[0]['fix'] != 'no repair found' else None
            if fix:
                fix = '\n'.join(fix.split('---\n>')[-1].split('\n')[:-1])
            edits_count = sum([len(patch["edits"]) for patch in patches])
            self.stats = Stats(**self.results, fix=fix, patch=patch, edits=edits_count, time_limit=timeout)
        self.metrics = self.stats()

    def __add__(self, other):
        if not isinstance(other, ChallengeResults):
            return NotImplemented

        return self.metrics + other.metrics

    def __truediv__(self, other):
        if not isinstance(other, int):
            return NotImplemented

        return self.metrics / other


class ToolResults:
    def __init__(self, path: Path, timeout: int, patches: dict, seed: int = 0):
        self.name = path.name
        self.path = path
        self.seed = seed
        self.challenge_results = [ChallengeResults(path=Path(challenge, f"result_{self.seed}.json"),
                                                   patch=patches[challenge.name],
                                                   timeout=timeout) for challenge in path.iterdir() if challenge.is_dir()]

    def __call__(self):
        metrics = Metrics()

        for cr in self.challenge_results:
            metrics += cr.metrics
        metrics /= len(self.challenge_results)

        return metrics()

    def performance(self):
        metrics = Metrics()

        for cr in self.challenge_results:
            metrics += cr.metrics
        metrics /= len(self.challenge_results)

        return {"efficiency": metrics.efficiency(), "efficacy": metrics.efficacy()}
