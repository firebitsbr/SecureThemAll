#!/usr/bin/env python3

# based on: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/RepairTool.py

import json
import datetime
from pathlib import Path
from typing import Callable

from core.setting import Setting


class RepairTool(Setting):
    def __init__(self, **kwargs):
        super(RepairTool, self).__init__(**kwargs)
        self.repair_config = None
        self.patches = []
        self.output = ""
        self.error = ""
        self.results_path = self.configuration.paths.out_dir / Path(self.name)
        self.repair_begin = None
        self.repair_end = None
        self.tool_config_path = self.configuration.paths.data_dir / Path(f"{self.name.lower()}.json")

        if not self.tool_config_path.exists():
            raise ValueError(f"No such file {self.tool_config_path}.")

        with self.tool_config_path.open(mode="r") as tc:
            self.tool_configs = json.load(tc)

            if "program" in self.tool_configs:
                self.program = self.get_repair_tools_path() / Path(self.tool_configs["program"])
            else:
                raise ValueError(f"Tool binding failed. No program key in tool's configurations.")

        print(f"Discarded arguments {kwargs}")

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

    def save(self, parse_output_func: Callable, challenge_name: str):
        results = {"repair_begin": str(self.repair_begin), "repair_end": str(self.repair_end), "patches": self.patches}
        results.update(parse_output_func(self.output))
        results["duration"] = (self.repair_end - self.repair_begin).total_seconds()

        if self.error:
            results["error"] = self.error

        self.results_path = self.results_path / Path(challenge_name, str(self.seed), "result.json")
        self.results_path.parent.mkdir(parents=True, exist_ok=True)

        with self.results_path.open("w+") as res:
            json.dump(results, res, indent=2)

    def status(self):
        if len(self.patches) > 0:
            return "PATCHED"
        return "FINISHED"

    def __str__(self):
        return self.name

    def dispose(self, working_dir: Path):
        rm_cmd = f"rm -rf {working_dir}"
        super().__call__(cmd_str=rm_cmd)
