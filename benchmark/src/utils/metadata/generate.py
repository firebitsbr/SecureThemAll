#!/usr/bin/env python3

from os import walk, listdir

from utils.paths import get_challenge_paths, ChallengePaths
from utils.metadata.source_file import SourceFile


def get_challenge_source_files(challenge_name: str, source_path: str):
    paths = [x for x in walk(source_path)]
    paths = paths[1:]
    src_files = {}

    for tree in paths:
        main_path = tree[0]
        short_path = main_path.split(f"{challenge_name}/")[-1]

        # TODO: take into consideration the folder depth of some challenges

        if short_path.startswith("pov") or short_path.startswith("poller"):
            continue

        for file in tree[2]:
            if file.endswith(".c") or file.endswith(".cc") or file.endswith(".h"):
                src_files[f"{short_path}/{file}"] = SourceFile(main_path, file)

    return src_files


def get_challenge_manifest(paths: ChallengePaths):
    src_files = get_challenge_source_files(paths.name, paths.source)
    manifest = {}

    for file_path, src_file in src_files.items():
        if len(src_file) == 0 or (src_file.ext == "h" and len(src_file) > 0):
            continue

        manifest[file_path] = src_file.manifest()

    return manifest


def get_challenge_tests(paths: ChallengePaths):
    polls = [file for file in listdir(paths.polls) if file.endswith(".xml")]
    povs = [file for file in listdir(paths.build) if file.endswith(".pov")]

    pos_tests = len(polls)
    neg_tests = len(povs)
    polls.sort()
    povs.sort()
    # Map cases to tests names where p is for positive test cases and n is for negative test cases
    p_tests = ["p{}".format(n) for n in range(1, pos_tests + 1)]
    n_tests = ["n{}".format(n) for n in range(1, neg_tests + 1)]

    mapped_tests = dict(zip(p_tests + n_tests, polls + povs))

    return {"cases": mapped_tests, "pos-tests": pos_tests, "neg-tests": neg_tests}


def create_challenge_metadata(config, challenge_name: str):
    paths = get_challenge_paths(config, challenge_name)
    tests = get_challenge_tests(paths)
    manifest = get_challenge_manifest(paths)

    return {"tests": tests, "manifest": manifest}
