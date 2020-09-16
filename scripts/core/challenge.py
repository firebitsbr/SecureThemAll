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

	def get_manifest(self, path: bool = False, preprocessed: bool = False, string=False, prefix: Path = None):
		if path:
			return self.manifest_path

		if preprocessed:
			files = []

			for file in self.manifest:
				cpp_file = c_to_cpp(file)

				if prefix:
					cpp_file_prefix = prefix / Path(cpp_file)
					if string:
						files.append(str(cpp_file_prefix))
					else:
						files.append(cpp_file_prefix)
				else:
					if string:
						files.append(cpp_file)
					else:
						files.append(Path(cpp_file))

			return files

		return self.manifest

	def __str__(self):
		return f"{self.name}: {';'.join(self.manifest)}"
