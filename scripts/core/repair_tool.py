#!/usr/bin/env python3

# based on: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/RepairTool.py

import json
import datetime
from pathlib import Path
from typing import List

from core.setting import Setting


class RepairTool(Setting):
    def __init__(self,
                 repair_config: str,
                 **kwargs):
        super(RepairTool, self).__init__(**kwargs)
        self.repair_config = None
        self.patches = []
        self.repair_begin = None
        self.repair_end = None
        program = self._set_repair_config(repair_config)
        self.program = self.get_repair_tools_path() / program

        print(f"Discarded arguments {kwargs}")

    def _set_repair_config(self, config_file: str) -> Path:
        path = Path(config_file)
        
        if not path.exists():
            raise ValueError(f"No such file {path}.")
        
        with path.open(mode="r") as config_file:
            self.repair_config = json.load(config_file)

            if "program" in self.repair_config:
                return Path(self.repair_config["program"])

            return Path("")

    def diff(self, path: Path, path_compare: Path, cwd_path: Path = None):
        diff_cmd = f"diff {path} {path_compare}"
        out, err = super().__call__(cmd_str=diff_cmd, cmd_cwd=str(cwd_path) if cwd_path else cwd_path)

        if out:
            return out
        return ""

    def begin(self):
        self.repair_begin = datetime.datetime.now()

    def end(self):
        self.repair_end = datetime.datetime.now()

    def repair(self, repair_task):
        self.begin()
        self.end()
        self._write_result(repair_task)
        pass

    def __str__(self):
        return self.name

    def dispose(self, working_dir: Path):
        pass
