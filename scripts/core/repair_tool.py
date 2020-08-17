#!/usr/bin/env python3

# based on: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/RepairTool.py

import os
import json
import time
import random
import shutil
import datetime

from core.challenge import Challenge
from config import WORKING_DIRECTORY, ROOT_DIR
from scripts.core.utils import checkout_command

from benchmark.src.utils.paths import get_working_directory
from benchmark.src.utils.command import Command

LOCK_FILE = "LOCK_CHALS_INIT"


def is_lock():
    return os.path.exists(os.path.join(ROOT_DIR, LOCK_FILE))


def wait_lock():
    while is_lock():
        secs = random.randrange(2, 8)
        time.sleep(secs)


def lock():
    f = open(os.path.join(ROOT_DIR, LOCK_FILE), "w+")
    f.close()
    pass


def unlock():
    path = os.path.join(ROOT_DIR, LOCK_FILE)
    if os.path.exists(path):
        os.remove(path)


class RepairTool(object):
    def __init__(self, name, config_name):
        self.config = None
        self.name = name
        self.config_file = config_name
        self.repair_begin = None
        self.parse_data()
        self.seed = 0
        self.working_dir = None
        pass

    def parse_data(self):
        path = os.path.realpath(self.config_file)
        
        if not os.path.exists(path):
            raise ValueError(f"No such file {path}.")
        
        with open(path) as config_file:
            self.config = json.load(config_file)

    def init_challenge(self, challenge: Challenge):
        wd = os.path.join(WORKING_DIRECTORY, f"{self.name}_{challenge.name}_{self.seed}")
        self.working_dir = get_working_directory(wd, challenge.name)

        if os.path.exists(wd):
            shutil.rmtree(wd)
        try:
            wait_lock()
            lock()
            co_cmd = checkout_command(wd, challenge.name)
            cmd = Command(co_cmd)
            cmd(verbose=True, timeout=30)
        finally:
            unlock()
        self.repair_begin = datetime.datetime.now().__str__()

    def get_info(self, challenge):
        pass

    def repair(self, repair_task):
        self.init_challenge(repair_task.challenge)
        self.get_info(repair_task.challenge)

    def __str__(self):
        return self.name

