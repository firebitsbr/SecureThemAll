#!/bin/bash

workingdir=`pwd`
echo $workingdir

cd repair_tools/genprog-code/
echo "Installing Genprog dependencies..."
echo "Installing OCAML..."
apt install ocaml ocamlbuild
echo "Downloading CIL..."
wget http://downloads.sourceforge.net/project/cil/cil/cil-1.7.3.tar.gz
echo "Extracting..."
tar xvzf cil-1.7.3.tar.gz
echo "Removing tar..."
rm cil-1.7.3.tar.gz
cd cil-1.7.3
echo "Configuring CIL..."
sh ./configure
echo "Building CIL..."
make
make cillib
export CIL=`pwd`
echo "Building GenProg..."
cd ..
make
cd $workingdir

cd benchmark/
echo "Installing cb-multios dependencies..."
apt-get install libc6-dev libc6-dev-i386 gcc-multilib g++-multilib clang cmake
pip install xlsxwriter pycrypto
echo "Initializing Benchmark..."

sh ./init.sh

cd $workingdir
echo "SecureThemAll sucessfully initialized..."
