#!/usr/bin/env python3
import argparse

from .utils import get_benchmark

benchmark = get_benchmark()
repair_tools = {}

parser = argparse.ArgumentParser(prog="repair", description='Repair bugs')
challenge_parser = argparse.ArgumentParser(add_help=False)
challenge_parser.add_argument("--continue",
                              help="Continue the previous execution",
                              action='store_true',
                              dest='continue_execution',
                              default=False)
challenge_parser.add_argument("--endTime", help="Specify an hour to stop the execution (hh:mm)", dest="end_time",
                              default=None)

challenge_parser.add_argument("--challenges", "-c", nargs='+', help="The challenge name")

subparsers = parser.add_subparsers()


def add_repair_tool(name, init_func, description):
    repair_tools[name] = init_func
    tool_parser = subparsers.add_parser(name, help=description, parents=[challenge_parser])
    tool_parser.set_defaults(func=init_func)
    return tool_parser


import scripts.core.repair_tools.genprog
