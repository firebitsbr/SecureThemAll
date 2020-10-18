
from core.utils.metrics import Metrics

# Low bound constant
c = 10


def inv_eq(x: int, upper: int):
    return c**(-x/upper)


class Stats:
    def __init__(self, time_limit: int = 0, comps: int = 0, failed_comps: int = 0, duration: int = None,
                 fix: bool = False, edits: int = None, passed_tests: int = 0, failed_tests: int = 0, **kwargs):
        self.comps = comps
        self.failed_comps = failed_comps
        self.passed_tests = passed_tests
        self.failed_tests = failed_tests
        # in seconds
        self.duration = duration
        self.edits = edits-1 if fix else edits
        self.fix = fix
        self.time_limit = time_limit

    def __call__(self):
        return Metrics(compile_success_rate=self.compilation_success_rate(),
                       testing_success_rate=self.testing_success_rate(),
                       edits_score=self.edits_score(),
                       time_score=self.time_score())

    def compilation_success_rate(self):
        if self.comps == 0:
            return 0
        return self.comps / (self.comps + self.failed_comps)

    def testing_success_rate(self):
        if self.passed_tests == 0:
            return 0
        return self.passed_tests / (self.passed_tests + self.failed_tests)

    def edits_score(self):
        # within 10 edits the score > 0.1
        if not self.edits:
            if self.fix:
                return 1
            return 0
        return inv_eq(self.edits, 40)

    def time_score(self):
        # inversely proportional to the time limit
        # e^(-x/time_limit)
        if not self.duration or self.duration <= 1:
            return 0
        # when the time limit is passed and fix is not found
        if self.duration > self.time_limit - 1 and not self.fix:
            return 0
        return inv_eq(self.duration, self.time_limit)

    def __str__(self):
        pass
