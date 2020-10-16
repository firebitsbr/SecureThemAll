#!/usr/bin/env python3

import json

from pathlib import Path
from typing import List


class Results:
    def __init__(self, out_path: Path):
        self.out_path = out_path
        self.begin = ""
        self.end = ""
        self.patches = []

    def __call__(self, begin: str, end: str, patches: List[dict]):
        self.begin = begin
        self.end = end
        self.patches = patches

        if len(self.patches) > 0:
            return "PATCHED"
        return "FINISHED"

    def write(self, stats: dict, err: str = None):
        results = {
            "repair_begin": self.begin,
            "repair_end": self.end,
            "patches": self.patches,
            "stats": stats
        }

        if err:
            results["error"] = err

        with self.out_path.open("w+") as res:
            json.dump(results, res, indent=2)
