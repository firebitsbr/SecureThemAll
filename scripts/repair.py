#!/usr/bin/env python3

import os
import sys

sys.path.append("..")

from scripts.core.input_parser import parser, benchmark
from core.runner.repair_task import RepairTask
from core.runner.local_runner import LocalRunner


if __name__ == "__main__":
    args = parser.parse_args()

    tasks = []
    challenges = benchmark.get_challenges().values()
    
    if args.challenges is not None:
        challenges = []
        for challenge_name in args.challenges:
            challenges.append(benchmark.get_challenge(challenge_name))

    for challenge in challenges:
        tool = args.func(args)
        task = RepairTask(tool, benchmark, challenge)

        if not args.continue_execution or not os.path.exists(os.path.join(task.log_dir(), "repair.log")):
            tasks.append(task)

    LocalRunner(tasks, args).execute()
