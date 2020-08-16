#!/usr/bin/env bash

echo "Building challenges..."
./cb-multios/build.sh

echo "Generating polls..."
./cb-multios/genpolls.sh

echo "Generating metadata file..."
python3 cb_multios_apr.py -o metadata

echo "Updating build system's config file..."
mv CMakeLists.txt ./cb-multios/CMakeLists.txt

echo "Adding challenges checkout script file..."
mv checkout.sh ./cb-multios/checkout.sh