#!/usr/bin/env python3

from context import context
from input_parser import parser

if __name__ == "__main__":
    args = parser.parse_args()

    context(args.challenge_name, args.working_directory)

    operation_args = {"context": context, "name": args.name}

    vars_args = dict(vars(args))

    # Arguments discarded
    vars_args.pop("challenge_name")
    vars_args.pop("working_directory")
    vars_args.pop("opr")

    operation_args.update(vars_args)

    operation = args.opr(**operation_args)
    operation()
