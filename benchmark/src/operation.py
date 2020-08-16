#!/usr/bin/env python3

from context import Context


class Operation:
    def __init__(self, name: str, context: Context):
        self.name = name
        self.context: Context = context

    def __call__(self):
        pass

    def __str__(self):
        return f"{self.name} -wd {self.context.working_directory.root.name} -cn {self.context.challenge_name}"

