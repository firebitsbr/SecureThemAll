

class Metrics:
    def __init__(self, compile_success_rate: float = 0, testing_success_rate: float = 0, edits_score: float = 0,
                 time_score: float = 0):
        self.compile_success_rate = compile_success_rate
        self.testing_success_rate = testing_success_rate
        self.edits_score = edits_score
        self.time_score = time_score
        self.score = self.compile_success_rate + self.edits_score + self.time_score

    def __call__(self, *args, **kwargs):
        return {
            "compile success rate": self.compile_success_rate,
            "testing success rate": self.testing_success_rate,
            "edits score": self.edits_score,
            "time score": self.time_score
        }

    def __add__(self, other):
        if not isinstance(other, Metrics):
            return NotImplemented

        return Metrics(self.compile_success_rate + other.compile_success_rate,
                       self.testing_success_rate + other.testing_success_rate,
                       self.edits_score + other.edits_score,
                       self.time_score + other.time_score)

    def __truediv__(self, other):
        if not isinstance(other, int):
            return NotImplemented

        compile_success_rate = self.compile_success_rate / other if self.compile_success_rate != 0 else 0
        testing_success_rate = self.testing_success_rate / other if self.testing_success_rate != 0 else 0
        edits_score = self.edits_score / other if self.edits_score != 0 else 0
        time_score = self.time_score / other if self.time_score != 0 else 0

        return Metrics(compile_success_rate, testing_success_rate, edits_score, time_score)
