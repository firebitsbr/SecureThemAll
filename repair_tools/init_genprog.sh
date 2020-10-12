#!/bin/bash

CURRENT_DIR=$(pwd)
DOWNLOAD_DIR="/tmp/genprog"
WORKING_DIR=$CURRENT_DIR/genprog-code
CIL_DIR=$WORKING_DIR/cil-cg/cil-1.7.3

echo "Installing Genprog dependencies..."
apt -y install ocaml ocamlbuild || (echo "Failed to install ocaml dependencies." && exit 1)
mkdir $DOWNLOAD_DIR -p
pushd $DOWNLOAD_DIR || (echo "Failed to move to download directory." && exit 1)
echo "Downloading CIL..."
wget -O cil.tar.gz http://downloads.sourceforge.net/project/cil/cil/cil-1.7.3.tar.gz
echo "Extracting..."
mkdir "$CIL_DIR" -p
tar xvzf cil.tar.gz -C "$CIL_DIR"
echo "Removing tar..."
rm cil.tar.gz
popd || exit
pushd "$CIL_DIR" || (echo "Failed to move to cil directory." && exit 1)
echo "Configuring CIL..."
sh ./configure
echo "Building CIL..."
make
make cillib
export CIL=$CIL_DIR
# set variable permanent
# omake src
echo "Building GenProg..."
popd || exit
pushd "$WORKING_DIR" || (echo "Failed to move to working directory." && exit 1)
make
popd || exit
echo "Successfully initialized GenProg"