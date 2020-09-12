#!/usr/bin/env python3

# based on: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/RepairTool.py

import os
import json
import time
import random
import shutil
import datetime
from pathlib import Path

from core.challenge import Challenge
from core.benchmark import Benchmark


LOCK_FILE = "LOCK_CHALS_INIT"


def is_lock(root_dir: str):
    return os.path.exists(os.path.join(root_dir, LOCK_FILE))


def wait_lock(root_dir: str):
    while is_lock(root_dir):
        secs = random.randrange(2, 8)
        time.sleep(secs)


def lock(root_dir: str):
    f = open(os.path.join(root_dir, LOCK_FILE), "w+")
    f.close()
    pass


def unlock(root_dir):
    path = os.path.join(root_dir, LOCK_FILE)
    if os.path.exists(path):
        os.remove(path)


class RepairTool(object):
    def __init__(self,
                 name: str,
                 config_path: str,
                 working_dir: str,
                 tools_path: Path,
                 root_path: Path,
                 **kwargs):
        self.config = None
        self.name = name
        self.repair_begin = None
        self.seed = 0
        self.working_dir = working_dir
        self.root = root_path
        program = self._set_config(config_path)
        self.program = tools_path / program

        print(f"Discarded arguments {kwargs}")

    def _set_config(self, config_file: str) -> Path:
        path = os.path.realpath(config_file)
        
        if not os.path.exists(path):
            raise ValueError(f"No such file {path}.")
        
        with open(path) as config_file:
            self.config = json.load(config_file)

            if "program" in self.config:
                return Path(self.config["program"])

            return Path("")

    def init_challenge(self, benchmark: Benchmark, challenge_name: str) -> Challenge:
        wd = os.path.join(self.working_dir, f"{self.name}_{challenge_name}_{self.seed}")

        #if os.path.exists(wd):
            #shutil.rmtree(wd)
        try:
            wait_lock(str(self.root))
            lock(str(self.root))
            challenge = benchmark.checkout(working_directory=wd, challenge_name=challenge_name)
        finally:
            unlock(str(self.root))
        self.repair_begin = datetime.datetime.now().__str__()

        return challenge

    def repair(self, repair_task):
        pass

    def __str__(self):
        return self.name

