#!/usr/bin/env python3

from pathlib import Path
from .utils.parse import c_to_cpp


class Challenge:
	def __init__(self, name: str, working_dir: Path):
		self.name = name
		self.working_dir = working_dir
		self._load_manifest()

	def _load_manifest(self):
		self.manifest_path = self.working_dir / Path(self.name, "manifest.txt")

		if self.manifest_path.exists():
			with self.manifest_path.open(mode="r") as m:
				self.manifest = m.read().splitlines()
				self.multi_file = len(self.manifest) > 1
		else:
			self.manifest = []
			self.multi_file = 0

	def get_manifest(self, path: bool = False, preprocessed: bool = False, string=False):
		if path:
			return self.manifest_path

		if preprocessed:
			files = [c_to_cpp(file) for file in self.manifest]
			return '\n'.join(files) if string else files

		return self.manifest

	def __str__(self):
		return f"{self.name}: {';'.join(self.manifest)}"
