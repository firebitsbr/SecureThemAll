

class Metrics:
    def __init__(self, compile_success_rate: float = 0, testing_success_rate: float = 0, edits_score: float = 0,
                 fix_score: float = 0, similarity: float = 0, time_score: float = 0):
        self.compile_success_rate = compile_success_rate
        self.testing_success_rate = testing_success_rate
        self.edits_score = edits_score
        self.fix_score = fix_score
        self.similarity = similarity
        self.time_score = time_score
        self.score = self.compile_success_rate + self.edits_score + self.time_score

    def __call__(self, *args, **kwargs):
        return {
            "compile success rate": self.compile_success_rate,
            "testing success rate": self.testing_success_rate,
            "edits score": self.edits_score,
            "fix score": self.fix_score,
            "similarity": self.similarity,
            "time score": self.time_score
        }

    def efficiency(self):
        return self.edits_score + self.time_score

    def efficacy(self):
        return self.compile_success_rate + self.testing_success_rate + self.fix_score + self.similarity

    def __add__(self, other):
        if not isinstance(other, Metrics):
            return NotImplemented

        return Metrics(self.compile_success_rate + other.compile_success_rate,
                       self.testing_success_rate + other.testing_success_rate,
                       self.edits_score + other.edits_score,
                       self.fix_score + other.fix_score,
                       self.similarity + other.similarity,
                       self.time_score + other.time_score)

    def __truediv__(self, other):
        if not isinstance(other, int):
            return NotImplemented

        compile_success_rate = self.compile_success_rate / other if self.compile_success_rate != 0 else 0
        testing_success_rate = self.testing_success_rate / other if self.testing_success_rate != 0 else 0
        edits_score = self.edits_score / other if self.edits_score != 0 else 0
        fix_score = self.fix_score / other if self.fix_score != 0 else 0
        similarity = self.similarity / other if self.similarity != 0 else 0
        time_score = self.time_score / other if self.time_score != 0 else 0

        return Metrics(compile_success_rate, testing_success_rate, edits_score, fix_score, similarity, time_score)
