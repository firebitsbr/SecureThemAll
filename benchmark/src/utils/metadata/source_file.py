#!/usr/bin/env python3

import re
from utils.metadata.snippet import Snippet

START = "^#(if|ifndef|ifdef) PATCHED"
CHANGE = "#else"
END = "#endif"


class SourceFile:
	def __init__(self, path, file):
		self.path = path
		self.file = file
		self.name, self.ext = file.split(".")
		self.snippets = []
		with open(f"{self.path}/{self.file}", "r") as file:
			self.lines = file.readlines()
		self.extract_snippets()

	def __len__(self):
		return len(self.snippets)

	def manifest(self):
		manifest = {"patches": [], "vulns": []}

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

