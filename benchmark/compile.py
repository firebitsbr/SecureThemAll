import sys
import os
import json
import re
from aux import *

with open (METADATA_FILE, "r") as json_file:
	METADATA = json.loads(json_file.read())

FILE_PATH_REGEX = '(\/*.*?\.[\w:]+)'


def replace_paths(command, source):
	replaced_source = re.sub(r'-c {}'.format(FILE_PATH_REGEX), r'-c {}'.format(source), command)
	removed_option = re.sub('-save-temps=obj', '', replaced_source)

	return removed_option


def get_command_source(challenge_name, source_name):
	challenge = METADATA[challenge_name]
	manifest = challenge["manifest"]

	for m_file, metadata in manifest.items():
		if source_name in m_file:
			return metadata["command"]

	return None


def get_source_name(file_path):
	path, file = file_path.split("/")[-2:]
	file_name = file.split(".")[0]
	return "{}/{}".format(path, file_name)


def main(argv):
	if(len(argv) < 2 or argv[0] == "-h" or argv[0] == "--help"):
		eprint("Usage: python test.py SOURCE_FILE CHALLENGE")
		exit(1)

	if "tmp" not in argv[0]:
		if argv[1] not in CHALLENGES:
			eprint("Challenge not found.")
			exit(1)

		previous_dir = os.getcwd()
		source = get_source_name(argv[0])
		
		chal_build_dir = "{}/{}".format(BIN_DIR, argv[1])
		chal_build_make = "{}/CMakeFiles/{}.dir".format(chal_build_dir, argv[1])
		chal_build_make_target = "{}/{}".format(chal_build_make, source.split("/")[-1] + ".c.o")
		chal_build_link_file = "{}/{}".format(chal_build_make, "link.txt")
		challenge = argv[1]
		
		command = get_command_source(challenge, source)
		modified_command = replace_paths(command, argv[0])
				
		os.chdir(chal_build_dir)
		# compile the preprocessed file to object
		os.system(modified_command)
		# link objects into executable
		os.system("cmake -E cmake_link_script {}".format(chal_build_link_file))
		os.chdir(previous_dir)

	else:
		with open("compile.txt", "w") as asd:
			asd.write(tmp_file)
		tmp_file = argv[0]
		path, file = tmp_file.split("/")
		fname, fext = file.split(".")
		os.system("gcc -E ${}/${}.i {}".format(path, file, tmp_file)) 


if __name__=="__main__":
	main(sys.argv[1:])