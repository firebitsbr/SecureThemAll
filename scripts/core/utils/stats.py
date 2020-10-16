
# Low bound constant
c = 10


def inv_eq(x: int, upper: int):
    return c**(-x/upper)


class Stats:
    def __init__(self, time_limit: int, comps: int = 0, failed_comps: int = 0, exec_time: int = None, fix: bool = False,
                 edits: int = None, **kwargs):
        self.comps = comps
        self.failed_comps = failed_comps
        # self.passed_tests = passed_tests
        # self.failed_tests = failed_tests
        # in seconds
        self.exec_time = exec_time
        self.edits = edits-1 if fix else edits
        self.fix = fix
        self.time_limit = time_limit

    def __call__(self):
        csr = self.compilation_success_rate()
        # tsr = self.testing_success_rate()
        es = self.edits_score()
        ts = self.time_score()
        score = csr + es + ts

        return {
            "compile success rate": csr,
            "edits score": es,
            "time score": ts,
            "score": score
        }

    def compilation_success_rate(self):
        if self.comps == 0:
            return 0
        return self.comps / (self.comps + self.failed_comps)

    '''
    def testing_success_rate(self):
        if self.passed_tests == 0:
            return 0
        return self.passed_tests / (self.passed_tests + self.failed_tests)
    '''
    def edits_score(self):
        # within 10 edits the score > 0.1
        if not self.edits:
            return 0
        return inv_eq(self.edits, 40)

    def time_score(self):
        # inversely proportional to the time limit
        # e^(-x/time_limit)
        if not self.exec_time or self.exec_time <= 1:
            return 0
        # when the time limit is passed and fix is not found
        if self.exec_time > self.time_limit - 1 and not self.fix:
            return 0
        return inv_eq(self.exec_time, self.time_limit)

    def __str__(self):
        pass
