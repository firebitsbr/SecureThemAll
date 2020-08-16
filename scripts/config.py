#!/usr/bin/env python3

import os

ROOT_DIR = os.path.dirname(os.path.dirname(__file__))
BENCHMARK_DIR = os.path.join(ROOT_DIR, "benchmark")
REPAIR_TOOLS_DIR = os.path.join(ROOT_DIR, "repair_tools")
SCRIPTS_DIR = os.path.dirname(os.path.abspath(__file__))
WORKING_DIRECTORY = os.path.join("/tmp/")
OUTPUT_PATH = os.path.join(ROOT_DIR, "results")

LOCAL_THREAD = 2

# In minutes
TOOL_TIMEOUT = "120"
