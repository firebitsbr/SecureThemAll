#!/usr/bin/env python3

import json

from config import configuration
from utils.metadata.generate import create_challenge_metadata
from utils.challenges import get_coverage
from utils.streams import progress

if __name__ == "__main__":
	"""
	generates the metadata file
	"""

	challenges = get_coverage(configuration.challenges)
	total_chals = len(challenges)
	metadata = {}

	for i, challenge in enumerate(challenges):
		progress(i + 1, total_chals, f"Processing {challenge}")

		metadata[challenge] = create_challenge_metadata(configuration, challenge)

	print(metadata)
	#with configuration.metadata.open('w') as json_file:
	#	json.dump(metadata, json_file, sort_keys=True, indent=4)

	print("Metadata file successfully generated.")
