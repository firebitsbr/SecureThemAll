#!/usr/bin/env python3


class Snippet:
    def __init__(self, start):
        self.start = start
        self.change = None
        self.end = None
        self.patch = []
        self.vuln = []
        self.state = None

    def __call__(self, line=None, state=None):
        if state is not None:
            self.state = state
        elif line is not None:
            if self.state == "patch":
                self.patch.append(line)
            elif self.state == "vuln":
                self.vuln.append(line)

    def __len__(self):
        return self.end - self.start
