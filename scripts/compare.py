#!/usr/bin/env python3
from typing import List, Dict

import matplotlib.pyplot as plt
import argparse
import json
from pathlib import Path

from config import configuration
from core.benchmark import Benchmark
from core.utils.charts import star_chart

benchmark = Benchmark(config=configuration, seed=8888)

parser = argparse.ArgumentParser(prog="compare", description='Compares tools results')
parser.add_argument("--seed", type=int, help="The seed number of the results", default=0, required=True)

colors_list=['b', 'g', 'r', 'c', 'm', 'y', 'k', 'orange', 'gray', 'brown', 'lime', 'tan', 'teal']


def get_scores(seed_target: int):
    results_path: Path = configuration.paths.out_dir
    scores = {}

    for tool in results_path.iterdir():
        scores[tool.name] = []
        for challenge in tool.iterdir():
            for seed in challenge.iterdir():
                if int(seed.name) == seed_target:
                    result = seed / Path("result.json")
                    if result.exists():
                        with result.open(mode="r") as res:
                            results = json.loads(res.read())
                            if 'stats' in results:
                                scores[tool.name].append(results['stats']['score'])

    return scores


def get_star_data(results_path: Path, challenges_count: int, seed_target: int = 0):
    stats = {}

    for tool in results_path.iterdir():
        stats[tool.name] = {}
        for challenge in tool.iterdir():
            for seed in challenge.iterdir():
                if int(seed.name) == seed_target:
                    result = seed / Path("result.json")
                    if result.exists():
                        with result.open(mode="r") as res:
                            results = json.loads(res.read())
                            if 'stats' in results:
                                for k, v in results['stats'].items():
                                    if k in stats[tool.name]:
                                        stats[tool.name][k] += (v / challenges_count)
                                    else:
                                        stats[tool.name][k] = v / challenges_count

    return stats

#  stats = Stats(**parsed_output, exec_time=duration, fix=has_fix, edits=edits_count,
#                       time_limit=self.timeout)
#        edits_count = sum([len(patch["edits"]) for patch in self.patches])
#        has_fix = len(self.patches) > 0

def plot_ranks(scores: List[int], tools: List[str], colors: List[str]):
    axes = plt.gca()
    axes.set_ylim([0, 3])
    y_pos = [i for i in range(len(tools))]
    plt.bar(y_pos, scores, color=colors)
    plt.xticks(y_pos, tools)
    plt.ylabel('Score')
    plt.title('Tools ranking')
    plt.show()


def plot_star(star_data: Dict[str, Dict[str, int]], challenges_count: int):
    tools = list(star_data.keys())
    tools_count = len(tools)
    tools_stats = star_data.values()
    spoke_labels = list(tools_stats)[0].keys()
    star_chart([list(ts.values()) for ts in tools_stats], spoke_labels=list(spoke_labels), colors=colors_list[:tools_count],
               labels=tools, title=f"{tools_count} tools' profiling on {challenges_count} challenges with {len(spoke_labels)} metrics.")


if __name__ == "__main__":
    args = parser.parse_args()
#    scores = get_scores(args.seed)
#    print(scores)
    challenges = benchmark.get_challenges()
#    ranks = [sum(score)/len(challenges) for score in scores.values()]
#    plot_ranks(ranks, list(scores.keys()), ['red', 'green', 'yellow'])
    results_path = configuration.paths.out_dir
    data = get_star_data(results_path, len(challenges), args.seed)
    plot_star(data, len(challenges))
