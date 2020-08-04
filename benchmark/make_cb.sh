#!/bin/bash

if [ "$#" -ne 1 ]
then
	echo "Usage: ./make_cb.sh challenge_name"
	exit 1
else
	here_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
	chal_build_dir="$here_dir/cb-multios/build/challenges/$1"
	
	if [ ! -d $chal_build_dir ]
	then 
		echo "Directory $chal_build_dir does not exists."
		exit 1
	else
		pushd $chal_build_dir
		echo "Cleaning..."
		clean=$(make clean)
		echo $clean
		echo "Building..."
		build=$(make)
		echo $build
		popd
	fi
fi

