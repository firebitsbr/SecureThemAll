#!/usr/bin/env python3

import argparse

from config import configuration
from utils.exceptions import ChallengeNotCovered
from utils.challenges import get_info, get_coverage

parser = argparse.ArgumentParser(prog="info", description='Query information about the benchmark challenges.')
parser.add_argument("--challenge", "-c", help="The challenge name.")

if __name__ == "__main__":
    args = parser.parse_args()
    challenges = get_coverage(configuration.challenges)

    if args.challenge is not None:
        if args.challenge not in challenges:
            raise ChallengeNotCovered(f"Challenge {args.challenge} not covered.")

        print(get_info(configuration, args.challenge))
    else:
        print(f"{len(challenges)} - challenges covered:")

        for challenge in challenges:
            print(f"\t- {challenge[:-1]}")
