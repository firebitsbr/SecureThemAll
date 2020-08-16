#!/usr/bin/env python3

from benchmark.src.utils.paths import ChallengePaths


class Challenge:
	def __init__(self, name: str, paths, data: dict):
		self.name = name
		self.paths = paths
		self.manifest = data["manifest"]
		self.multifile = len(self.manifest) > 1
		self.tests = data["tests"]["cases"]
		self.pos_tests = data["tests"]["pos-tests"]
		self.neg_tests = data["tests"]["neg-tests"]
		self.working_directory = None

	def __str__(self):
		return f"{self.name}: {';'.join(self.manifest)}"
