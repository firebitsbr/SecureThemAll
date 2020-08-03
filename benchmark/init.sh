#!/usr/bin/env bash

echo "Updating build system's config file..."
mv CMakeLists.txt ./cb-multios/MakeLists.txt

echo "Building challenges..."
./cb-multios/build.sh

echo "Generating polls..."
./cb-multios/genpolls.sh

echo "Generating metadata file..."
python3 process.py -m

