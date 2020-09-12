#!/usr/bin/env python3

from dataclasses import dataclass
from os.path import dirname, abspath
from pathlib import Path
from core.utils.paths import ConfigPaths, BenchPaths, ConfigDirs

ROOT_DIR = dirname(dirname(__file__))
SOURCE_DIR = dirname(abspath(__file__))


@dataclass
class Configuration:
    paths: ConfigPaths
    bench_paths: BenchPaths
    dirs: ConfigDirs
    tools_timeout: str  # In seconds
    local_threads: int

    def validate(self):
        return self.paths.validate() and self.bench_paths.validate() \
               and int(self.tools_timeout) > 0 and self.local_threads > 0


config_paths = ConfigPaths(root=Path(ROOT_DIR),
                           src=Path(SOURCE_DIR),
                           working_dir=Path("/tmp"),
                           out_dir=Path(ROOT_DIR, "results"),
                           repair_tools=Path(ROOT_DIR, "repair_tools")
                           )

bench_root = Path(ROOT_DIR, "benchmark", "cb-repair")
bench_paths = BenchPaths(
    root=bench_root,
    program=bench_root / Path("src", "cb_repair.py")
)

config_dirs = ConfigDirs(
    coverage=Path(),
    instrument=Path()
)

configuration = Configuration(
    paths=config_paths,
    bench_paths=bench_paths,
    dirs=config_dirs,
    tools_timeout="1200",
    local_threads=2
)
