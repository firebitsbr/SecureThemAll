#!/usr/bin/env python3

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


def make_fresh_cb(challenge_name):
	chal_build_dir = f"{BIN_DIR}/{challenge_name}"
	previous_dir = os.getcwd()
	os.chdir(chal_build_dir)
	os.system(f"make clean")
	os.system(f"make")
	os.chdir(previous_dir)

def list_cbs():
	with open(f"{BENCH_DIR}/linux-final.txt", "r") as cbs:
		chals = cbs.readlines()
		print(f"Total covered challenges - {len(chals)}:")
		for chal in chals:
			print(f"\t- {chal[:-1]}")


def genprog_run(chal_name, pos_tests, neg_tests):
	repair_cmd = [f"{GENPROG_SRC}/repair", 
				"--search" ,"ga",
				"--compiler-command", f"\"python {COMPILE_SCRIPT} __SOURCE_NAME__ {chal_name} &> /dev/null\"",
				"--test-command", f"\"python {TEST_SCRIPT} {chal_name} __TEST_NAME__ >& /dev/null\"",
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

	cmd = ' '.join(repair_cmd)
	print(cmd)
	with open("log.txt", "w") as log:
		subprocess.call(cmd, shell=True, stdout=log, stderr=subprocess.STDOUT)
	make_fresh_cb(chal_name)

def main():
	"""
	main function that executes tasks based on command-line options
	"""
	parser: ArgumentParser = argparse.ArgumentParser()
	parser.add_argument('-c', '--challenge', help='Repairs specified challenge.', type=str)
	parser.add_argument('-pt', '--pos_tests', help='number of positive tests.', type=int)
	parser.add_argument('-nt', '--neg_tests', help='number of negative tests.', type=int)
	parser.add_argument('-lc', '--list_cbs', help='List the challenges the framework covers.', action='store_true')

	args = parser.parse_args()

	if args.list_cbs:
		list_cbs()		
		exit(0)

	if not os.path.exists(METADATA_FILE):
		print(f"No such file {METADATA_FILE}. Run \"python3 ./benchmark/process.py -m\"") 
		exit(1)

	with open(METADATA_FILE, "r") as json_file:
		metadata = json.loads(json_file.read())

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
