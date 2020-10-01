#!/usr/bin/env python3

from pathlib import Path
from typing import List

from .utils.parse import c_to_cpp


class Challenge:
    def __init__(self, name: str, working_dir: Path):
        self.name = name
        self.working_dir = working_dir
        self.source = working_dir / Path(name)
        self.manifest = Manifest(path=self.working_dir / Path(self.name, "manifest.txt"))

    def __str__(self):
        return f"{self.name}: {self.manifest}"


class Manifest:
    def __init__(self, path: Path):
        self.path = path
        # {"file_path": [vuln_lines]}
        self.files = {}
        self.preprocessed = {}

        if self.path.exists():
            with self.path.open(mode="r") as m:
                files = m.read().splitlines()

                for file in files:
                    vuln_lines = file.split()
                    file_path = vuln_lines[0]
                    vuln_lines = vuln_lines[1:] if len(vuln_lines) > 1 else []
                    self.files[file_path] = vuln_lines
                    cpp_file_name = c_to_cpp(file_path)
                    self.preprocessed[cpp_file_name] = vuln_lines

        self.multi_file = len(self.files) > 1

    def get_vuln_lines(self):
        return [self.files[file] for file in self.files]

    def __call__(self, preprocessed=False, prefix: Path = None) -> List[Path]:
        if preprocessed:
            if prefix:
                return [prefix / Path(cpp_file) for cpp_file in self.preprocessed.keys()]
            return list(self.preprocessed.keys())

        if prefix:
            return [prefix / Path(file) for file in self.files.keys()]
        return [Path(file) for file in self.files.keys()]

    # FIX THIS MONSTROSITY
    # if self.multi_file:
    #	with self.path.open(mode="w") as m:
    #		m.write(self.get_manifest(string=True, preprocessed=True))

    def __str__(self, preprocessed=False, prefix: Path = None):
        return ' '.join([str(file) for file in self(preprocessed=preprocessed, prefix=prefix)])
