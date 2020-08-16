#!/usr/bin/env python3

import subprocess
import argparse
import os

from src.config import SOURCE_DIR

OPERATIONS = ['info', 'metadata']


def main():
    parser = argparse.ArgumentParser(prog="CB-MultiOs-APR", description='CB-MultiOs-APR interface')
    parser.add_argument('-o', '--operation', help='Benchmark\'s operations.',
                        choices=OPERATIONS, type=str, required=True)

    args = parser.parse_args()
    subprocess.call(f"python3 {os.path.join(SOURCE_DIR, args.operation)}.py", shell=True)


if __name__ == "__main__":
    main()
