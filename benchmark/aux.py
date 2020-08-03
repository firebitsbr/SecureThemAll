import os

BENCH_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(BENCH_DIR)
LINUX_CHALLENGES_FILE = os.path.join(BENCH_DIR, 'linux-final.txt')
CB_DIR = os.path.join(BENCH_DIR, 'cb-multios')
CHAL_DIR = os.path.join(CB_DIR, 'challenges')
POLL_DIR = os.path.join(CB_DIR, 'polls')
TOOLS_DIR = os.path.join(CB_DIR, 'tools')
BUILD_DIR = os.path.join(CB_DIR, 'build')
BIN_DIR = os.path.join(BUILD_DIR, 'challenges')
COMPILE_COMMANDS_FILE = os.path.join(BUILD_DIR, 'compile_commands.json')
METADATA_FILE = os.path.join(BENCH_DIR, 'metadata.json')

with open(LINUX_CHALLENGES_FILE, "r") as lf:
	CHALLENGES = lf.readlines()
CHALLENGES = tuple([c.replace("\n", "") for c in CHALLENGES])