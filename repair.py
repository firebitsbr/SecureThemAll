#!/usr/bin/env python

import os
import sys
import argparse
import json
import subprocess
from benchmark.aux import METADATA_FILE, CHALLENGES

RUN_DIR = os.path.dirname(os.path.abspath(__file__))
BENCH_DIR = os.path.join(RUN_DIR, "benchmark")
CB_DIR = os.path.join(BENCH_DIR, "cb-multios")
BUILD_DIR = os.path.join(CB_DIR, "build")
TEST_SCRIPT = os.path.join(BENCH_DIR, "test.py")
COMPILE_SCRIPT = os.path.join(BENCH_DIR, "compile.py")
GENPROG_DIR = os.path.join(RUN_DIR, "repair_tools", "genprog-code")
GENPROG_SRC = os.path.join(GENPROG_DIR, "src")


with open(METADATA_FILE, "r") as json_file:
	metadata = json.loads(json_file.read())

CHAL = "Accel"


def get_preprocessed_dir(chal_name):
	return f"{BUILD_DIR}/challenges/{chal_name}/CMakeFiles/{chal_name}.dir"


def write_manifest(chal_name ,challenge):
	with open("manifest.txt", "w") as mf:
		manifest = challenge["manifest"]

		for file in manifest:
			file = file.split(chal_name)[-1]
			file = file[1:].split(".")
			file[-1] = "i"
			mf.write('.'.join(file) + "\n")


def genprog_run(chal_name, pos_tests, neg_tests):
	repair_cmd = [f"{GENPROG_SRC}/repair", 
				"--search" ,"ga",
				"--compiler-command", f"python {COMPILE_SCRIPT} __SOURCE_NAME__ {chal_name} &> /dev/null",
				"--test-command", f"python {TEST_SCRIPT} {chal_name} __TEST_NAME__ >& /dev/null",
				"--crossover", "subset",
				"--rep", "cilpatch",
				"--describe-machine",
				"--pos-tests", f"{pos_tests}",
				"--neg-tests", f"{neg_tests}",
				"--program", f"{RUN_DIR}/manifest.txt",
				"--prefix", f"{get_preprocessed_dir(chal_name)}",
				"--seed", "0",
				"--mt-cov",
				"--rep-cache", "default.cache"
				]

	#cmd = ' '.join(repair_cmd)
	with open("log.txt", "w") as log:
		subprocess.call(repair_cmd, shell=True, stdout=log, stderr=subprocess.STDOUT)
	
	with open("log.txt") as data_file:
		return data_file.read()


def main():
	"""
	main function that executes tasks based on command-line options
	"""
	parser: ArgumentParser = argparse.ArgumentParser()
	parser.add_argument('-c', '--challenge', help='Repairs specified challenge.', type=str)
	parser.add_argument('-pt', '--pos_tests', help='number of positive tests.', type=int)
	parser.add_argument('-nt', '--neg_tests', help='number of negative tests.', type=int)

	args = parser.parse_args()

	if args.challenge not in CHALLENGES:
		raise ValueError("Challenge was not found.")
		exit(1)
	
	challenge = metadata[args.challenge]
	
	pos_tests = challenge["tests"]["pos-tests"]
	neg_tests = challenge["tests"]["neg-tests"]
	
	if args.pos_tests and args.pos_tests <= pos_tests:
		pos_tests = args.pos_tests

	if args.neg_tests and args.neg_tests <= neg_tests:
		neg_tests = args.neg_tests	

	write_manifest(args.challenge ,challenge)
	genprog_run(args.challenge, str(pos_tests), str(neg_tests))


if __name__ == "__main__":
	main()
