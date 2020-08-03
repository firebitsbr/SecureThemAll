#!/bin/bash

echo "Downloading Genprog..."
cd repair_tools/
git clone https://github.com/squaresLab/genprog-code.git
cd genprog-code/

echo "Installing Genprog dependencies"
add-apt-repository ppa:avsm/ppa
apt update
apt install opam
opan init
opam install cil
opam config env

cd src/
make

cd ../../../

echo "Downloading cb-multios..."
cd benchmark/
git clone https://github.com/trailofbits/cb-multios.git
cd ..
echo "Installing cb-multios dependencies..."
apt-get install libc6-dev libc6-dev-i386 gcc-multilib g++-multilib clang cmake

echo "Initializing Benchmark..."
cd benchmark/
./init.sh
cd ..
echo "SecureThemAll sucessfully initialized..."

