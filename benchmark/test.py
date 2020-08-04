#!/usr/bin/env python3

import sys
import os
import glob
import subprocess
import json
from aux import *


with open (METADATA_FILE, "r") as json_file:
	metadata = json.loads(json_file.read())

def eprint(*args, **kwargs):
	print(args, file=sys.stderr, **kwargs)


def get_tests(chal_name):
	return metadata[chal_name]["tests"]["cases"]


class Challenge:
	def __init__(self, name):
		self.name = name
		self.bin_dir = os.path.join(BIN_DIR, self.name)
		self.chal_dir = os.path.join(CHAL_DIR, self.name)
		self.tests = get_tests(self.name)

	@staticmethod
	def parse_results(output, is_pov):
		""" Parses out the number of passed and failed tests from cb-test output

		Args:
			output (str): Raw output from running cb-test
		Returns:
			(int, int): # of tests run, # of tests passed
		"""
		# If the test failed to run, consider it failed
		if 'TOTAL TESTS' not in output:
			print('\nWARNING: there was an error running a test')
			print(output)
			return 0, 0

		if 'timed out' in output:
			print('\nWARNING: test(s) timed out')

		# Parse out results
		total = output.split('TOTAL TESTS: ')[1].split('\n')[0]
		passed = output.split('TOTAL PASSED: ')[1].split('\n')[0]

		if is_pov:
			passed = '0' if passed == '1' else '1'
		
		if passed == '0':
			 exit(1)

		return total, passed

	def test(self, test):
		# Collect the names of binaries to be tested
		cb_dirs = glob.glob(os.path.join(self.chal_dir, 'cb_*'))
		xml = self.tests[test]
		is_pov = test[0] == 'n'

		if len(cb_dirs) > 0:
			# There are multiple binaries in this challenge
			bin_names = ['{}_{}'.format(self.name, i + 1) for i in range(len(cb_dirs))]
		else:
			bin_names = [self.name]

		cb_cmd = [os.path.join(TOOLS_DIR, 'cb-test.py'),
					'--directory', self.bin_dir,
					'--xml', xml, 
					'--concurrent', '4',
					'--timeout', '60',
					'--negotiate_seed', '--cb'] + bin_names
		
		if is_pov:
			cb_cmd += ['--should_core']

		p = subprocess.Popen(cb_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=TOOLS_DIR)
		out, err = p.communicate(timeout=60)
		out = out.decode("utf-8") 
		os.system(f"killall -9 {self.name} &> /dev/null")
		

		if err:
			eprint(err)
			exit(1)
		else:
			print(out)

		total, passed = self.parse_results(out, is_pov)

		return passed


def main(argv):
	if(len(argv) < 2 or argv[0] == "-h" or argv[0] == "--help"):
		eprint("Usage: python test.py EXE_NAME TEST_NAME")
		exit(1)

	if argv[0] not in CHALLENGES:
		eprint("Challenge not found.")
		exit(1)

	challenge = Challenge(argv[0])
	
	if argv[1] not in challenge.tests:
		eprint("Test not found.")
		exit(1)

	result = challenge.test(argv[1])
	sys.stdout.write(result)

	#exit(0)

if __name__=="__main__":
	main(sys.argv[1:])

