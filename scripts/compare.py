#!/usr/bin/env python3
from typing import List

import matplotlib.pyplot as plt
import numpy as np
import argparse
from pathlib import Path

from config import configuration
from core.benchmark import Benchmark
from core.utils.charts import star_chart, plot_stacked_bar, plot_heatmap, plot_venn3
from core.utils.results import ToolResults
from core.utils.stream import progress


benchmark = Benchmark(config=configuration, seed=8888)
benchmark.verbose = False
challenges_count = len(benchmark.challenges)
patches = {}

for i, cn in enumerate(benchmark.challenges):
    progress(i+1, challenges_count, suffix=f"Querying patch for {cn}")
    patches[cn] = benchmark.patch(cn)

parser = argparse.ArgumentParser(prog="compare", description='Compares tools results')
parser.add_argument("--seed", type=int, help="The seed number of the results", default=0)
parser.add_argument("--plot", choices=["stacked", "star", "heatmap", "venn"], required=True,
                    type=str, help="The seed number of the results")
tools_timeout = configuration.tools_timeout
colors_list = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'orange', 'gray', 'brown', 'lime', 'tan', 'teal']


def get_tools_results(results_dir: Path, seed_target: int = 0):
    return [ToolResults(tool, tools_timeout, patches, seed_target) for tool in results_dir.iterdir() if tool.is_dir()]


def plot_ranks(scores: List[int], tools: List[str], colors: List[str]):
    axes = plt.gca()
    axes.set_ylim([0, 3])
    y_pos = [i for i in range(len(tools))]
    plt.bar(y_pos, scores, color=colors)
    plt.xticks(y_pos, tools)
    plt.ylabel('Score')
    plt.title('Tools ranking')
    plt.show()


def plot_star(star_data: List[ToolResults], challenges_count: int):
    tools_names = [tool.name for tool in star_data]
    tools_count = len(tools_names)
    tools_metrics = [tool() for tool in star_data]
    tools_results = [list(metrics.values()) for metrics in tools_metrics]
    spoke_labels = [list(metrics.keys()) for metrics in tools_metrics]

    star_chart(tools_results, spoke_labels=spoke_labels[0], colors=colors_list[:tools_count], labels=tools_names,
               title=f"{tools_count} tools' profiling on {challenges_count} challenges with {len(spoke_labels[0])} metrics.")


def plot_stacked(data: List[List[float]], series_labels: List[str], category_labels: List[str]):
    labels_count = len(series_labels)
    colors = colors_list[:labels_count]
    print(data)
    plot_stacked_bar(
        data,
        series_labels,
        category_labels=category_labels,
        show_values=True,
        value_format="{:.1f}",
        colors=colors,
        y_label="Score"
    )

    plt.savefig('bar.png')
    plt.show()


if __name__ == "__main__":
    args = parser.parse_args()
#    scores = get_scores(args.seed)
#    print(scores)
    #challenges = benchmark.get_challenges()
#    ranks = [sum(score)/len(challenges) for score in scores.values()]
#    plot_ranks(ranks, list(scores.keys()), ['red', 'green', 'yellow'])
    results_path = configuration.paths.out_dir
    results = get_tools_results(results_path, args.seed)
    if args.plot == "star":
        plot_star(results, 69)
    elif args.plot == "stacked":
        tools_names = [tool.name for tool in results]
        tools_performance = [tool.performance() for tool in results]
        print(tools_performance)
        performance_labels = [list(tp.keys()) for tp in tools_performance]
        plot_stacked(data=np.transpose([list(tp.values()) for tp in tools_performance]), series_labels=performance_labels[0],
                     category_labels=tools_names)
    elif args.plot == "heatmap":
        tools_names = [tool.name for tool in results]
        challenges_names = [[cr.path.parent.name for cr in tool.challenge_results] for tool in results]
        tools_fix_score = [[cr.metrics.fix_score for cr in tool.challenge_results] for tool in results]
        plot_heatmap(matrix=tools_fix_score, x_labels=challenges_names[0], y_labels=tools_names,
                     title="Fixed challenges heatmap")
    elif args.plot == "venn":
        tools_names = tuple(tool.name for tool in results)
        tools_results = tuple(set(cr.path.parent.name for cr in tool.challenge_results if cr.stats.fix) for tool in results)
        plot_venn3(subsets=tools_results, labels=tools_names)
