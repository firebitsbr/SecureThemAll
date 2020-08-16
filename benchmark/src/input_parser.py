#!/usr/bin/env python3

import argparse

parser = argparse.ArgumentParser(prog="cb-multios", description='Benchmark for automatic program repair')
challenge_parser = argparse.ArgumentParser(add_help=False)
challenge_parser.add_argument('-cn', '--challenge_name', type=str, help='The challenge name.')
challenge_parser.add_argument('-wd', '--working_directory', type=str, help='The working directory.')

subparsers = parser.add_subparsers()


def add_operation(name: str, operation, description: str):
    operation_parser = subparsers.add_parser(name=name, help=description, parents=[challenge_parser])
    operation_parser.set_defaults(opr=operation)
    operation_parser.set_defaults(name=name)

    return operation_parser


import operations.compile
import operations.checkout
import operations.test
