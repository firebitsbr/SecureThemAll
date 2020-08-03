import pandas as pd
import os
import re
import argparse
import json
import glob
from aux import *

frame_columns = ['path', 'diff']
frame_path = "."

START = "^#(if|ifndef|ifdef) PATCHED"
CHANGE = "#else"
END = "#endif"


def get_compile_commands_mapping():
	with open (COMPILE_COMMANDS_FILE, "r") as json_file:
		COMPILE_COMMANDS = json.loads(json_file.read())

	mapping = {}

	for command in COMPILE_COMMANDS:
		challenge = command["directory"].split("/")[-1]
		file = command["file"].split(challenge+"/")[-1]

		if challenge not in CHALLENGES or "pov" in file or "_patched" in command["command"]:
			continue

		if challenge in mapping:
			mapping[challenge][file] = command["command"]
		else:
			mapping[challenge] = {file: command["command"]}

	return mapping


class Snippet:
	def __init__(self, start):
		self.start = start
		self.change = None
		self.end = None
		self.patch = []
		self.vuln = []
		self.state = None

	def __call__(self, line=None, state=None):
		if state is not None:
			self.state = state
		elif line is not None:
			if self.state == "patch":
				self.patch.append(line)
			elif self.state == "vuln":
				self.vuln.append(line)

	def __len__(self):
		return self.end - self.start


class SourceFile:
	def __init__(self, file_path):
		self.fpath = file_path
		self.file = file_path.split("/")[-1]
		self.name, self.ext = self.file.split(".")[-2:]
		self.snippets = []
		self.read()
		self.extract_snippets()

	def __len__(self):
		return len(self.snippets)

	def read(self):
		with open(self.fpath, "r") as file:
			self.lines = file.readlines()
		return self.lines

	def manifest(self, command):
		manifest = {"command": command , "patches": [], "vulns": []}

		for snippet in self.snippets:
			if snippet.change is not None:
				patch = list(range(snippet.start, snippet.change))
				vuln = list(range(snippet.change, snippet.end))
			else:
				patch = list(range(snippet.start, snippet.end))
				vuln = []
			manifest["patches"].append(patch)
			manifest["vulns"].append(vuln)

		return manifest
	
	def extract_snippets(self):
		snippet = None

		for i, line in enumerate(self.lines):
			stripped = line.strip()
			if snippet is None:
				match = re.search(START, stripped)
				if match:
					snippet = Snippet(i)
					snippet(state="patch")
					self.snippets.append(snippet)
			else:
				if stripped.startswith(CHANGE):
					snippet.change = i
					snippet(state="vuln")
				elif stripped.startswith(END):
					snippet.end = i
					snippet = None
				else:
					snippet(line=line)

	def transform(self):
		for snippet in self.snippets:
			patch_size = snippet.change - snippet.start
			vuln_size = snippet.end - snippet.change
			
			for i in range(1, patch_size):
				self.lines[snippet.start+i] = f"+{self.lines[snippet.start+i]}"

			for i in range(1, vuln_size):
				self.lines[snippet.change+i] = f"-{self.lines[snippet.change+i]}"

		return self.lines


class Challenge:
	def __init__(self, name, src_files:list):
		self.name = name
		print(f"Processing {name}")
		self.src_files = { file : SourceFile(file) for file in src_files}
		# TODO: fix this when considering .h for compiling
		self.skip = False
		
		for file in self.src_files.values():
			if file.ext == "h" and len(file.snippets) > 0:
				self.skip = True

	def __len__(self):
		return sum([len(src_file) for src_file in self.src_files.values()])

	def get_tests(self):
		# Gets POLLs and POVs path
		polls = glob.glob(os.path.join(POLL_DIR, self.name, 'poller', 'for-release', '*.xml'))
		povs = glob.glob(os.path.join(BIN_DIR, self.name, '*.pov'))
		pos_tests = len(polls)
		neg_tests = len(povs)
		polls.sort()
		povs.sort()
		# Map cases to tests names where p is for positive test cases and n is for negative test cases
		p_tests = [ "p{}".format(n) for n in range(1, pos_tests+1)]
		n_tests = [ "n{}".format(n) for n in range(1, neg_tests+1)]
		
		mapped_tests = dict(zip(p_tests + n_tests, polls + povs))

		return {"cases" : mapped_tests, "pos-tests" : pos_tests, "neg-tests" : neg_tests}

	def metadata(self, commands):
		print(f"Creating metadata for {self.name}")
		tests = self.get_tests()
		manifest = {}
		for file_path, src in self.src_files.items():
			file = file_path.split(self.name+"/")[-1]
			
			if len(src.snippets) == 0:
				continue

			manifest[file_path] = src.manifest(commands[file])

		return {"tests" : tests, "manifest" : manifest}


def get_challenge_files(challenge):
	trees = [x for x in os.walk(os.path.join(CHAL_DIR, challenge))]
	trees = trees[1:]
	files = []
	
	for tree in trees:
		path = tree[0]
		path_dirs = path.split("/")
		
		if len(path_dirs) >= 3 and (path_dirs[2].startswith("pov") or path_dirs[2].startswith("poller")):
			continue 
		
		for file in tree[2]:
			if file.endswith(".c") or file.endswith(".cc") or file.endswith(".h"):
				files.append(f"{path}/{file}")

	return files


def get_challenges():
	#subfolders = [ f.path for f in os.scandir(CHAL_DIR) if f.is_dir() ]
	chals = [Challenge(chal, get_challenge_files(chal)) for chal in CHALLENGES]
	filtered = [chal for chal in chals if chal is not None and not chal.skip]

	return filtered


def metadata():
	challenges = get_challenges()
	commands = get_compile_commands_mapping()
	chals_metadata = {chal.name : chal.metadata(commands[chal.name]) for chal in challenges}
	#print(chals_metadata)
	with open(METADATA_FILE, 'w') as json_file:
		json.dump(chals_metadata, json_file, sort_keys=True, indent=4)


def main():
	"""
	main function that executes tasks based on command-line options
	"""
	parser: ArgumentParser = argparse.ArgumentParser()
	parser.add_argument('-m', '--metadata', help='Creates json file with metadata from all challenges.', action='store_true')

	args = parser.parse_args()

	if args.metadata:
		metadata()


if __name__ == "__main__":
	main()