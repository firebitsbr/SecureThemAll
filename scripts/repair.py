#!/usr/bin/env python3

import os

from config import configuration
from core.input_parser import parser
from core.runner.repair_task import RepairTask
from core.runner.local_runner import LocalRunner
from core.benchmark import Benchmark

if __name__ == "__main__":
    args = parser.parse_args()

    tasks = []
    var_args = dict(vars(args))
    benchmark = Benchmark(config=configuration, **var_args)

    challenges = benchmark.get_challenges()

    if args.challenges is not None:
        challenges = []
        for challenge_name in args.challenges:
            challenges.append(challenge_name)

    for challenge in challenges:

        tool = args.repair_tool(config=configuration, **var_args)

        task = RepairTask(config=configuration,
                          tool=tool,
                          benchmark=benchmark,
                          challenge_name=challenge)

        if not args.continue_execution or not os.path.exists(os.path.join(task.log_dir(), "repair.log")):
            tasks.append(task)

    LocalRunner(tasks, configuration.local_threads, args).execute()
