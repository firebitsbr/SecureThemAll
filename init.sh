#!/bin/bash

workingdir=`pwd`
echo $workingdir

cd repair_tools/genprog-code/
echo "Installing Genprog dependencies"
add-apt-repository ppa:avsm/ppa
apt update
apt install opam
opam init
opam depext conf-m4.1
opam install cil
opam config env
cd src/
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
