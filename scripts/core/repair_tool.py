#!/usr/bin/env python3

# based on: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/RepairTool.py

import os
import json
import datetime
from pathlib import Path

from core.setting import Setting


class RepairTool(Setting):
    def __init__(self,
                 repair_config: str,
                 **kwargs):
        super(RepairTool, self).__init__(**kwargs)
        self.repair_config = None
        self.repair_begin = None
        self.working_dir = self.configuration.paths.working_dir
        program = self._set_repair_config(repair_config)
        self.program = self.get_repair_tools_path() / program

        print(f"Discarded arguments {kwargs}")

    def _set_repair_config(self, config_file: str) -> Path:
        path = os.path.realpath(config_file)
        
        if not os.path.exists(path):
            raise ValueError(f"No such file {path}.")
        
        with open(path) as config_file:
            self.repair_config = json.load(config_file)

            if "program" in self.repair_config:
                return Path(self.repair_config["program"])

            return Path("")

    def begin(self):
        self.repair_begin = datetime.datetime.now().__str__()

    def repair(self, repair_task):
        self.begin()
        pass

    def __str__(self):
        return self.name

