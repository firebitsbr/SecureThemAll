#!/usr/bin/env bash

echo "Updating build system's config file..."
mv CMakeLists.txt ./cb-multios/CMakeLists.txt

echo "Updating polls generation script file..."
mv genpolls.sh ./cb-multios/genpolls.sh

echo "Building challenges..."
./cb-multios/build.sh

echo "Generating polls..."
./cb-multios/genpolls.sh

echo "Generating metadata file..."
python3 process.py -m

