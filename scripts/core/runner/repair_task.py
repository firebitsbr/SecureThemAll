#!/usr/bin/env python3

# from: https://github.com/program-repair/RepairThemAll/blob/8223384d1c354e6dea10c75d3db90b034ec11ae5/script/core/runner/RepairTask.py

import time
import os

from scripts.core.repair_tool import RepairTool
#from scripts.core.benchmark import Benchmark
from scripts.core.challenge import Challenge

from scripts.config import OUTPUT_PATH


class RepairTask(object):

    def __init__(self, tool: RepairTool, benchmark, challenge: Challenge):
        """"
        :type tool: RepairTool
        :type benchmark: CBMultiOs
        :type challenge: Challenge
        """
        self.tool = tool
        self.benchmark = benchmark
        self.challenge = challenge
        self.status = None
        self.id = None
        self.results = None
        self.starting_date = None
        self.end_date = None
        self.log_dir = os.path.join(OUTPUT_PATH, self.challenge.name, self.tool.name, str(self.tool.seed))

    def run(self):
        self.starting_date = time.time()
        return self.tool.repair(self)
