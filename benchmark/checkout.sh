#!/usr/bin/env bash

if [ "$#" -ne 2 ]
then
	echo "Usage: ./build.sh working_directory challenge_name"
	exit 1
fi

set -e

# Root cb-multios directory
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ -z "${NO_PYTHON_I_KNOW_WHAT_I_AM_DOING_I_SWEAR}" ]]; then
  # Install necessary python packages
  if ! /usr/bin/env python -c "import xlsxwriter; import Crypto" 2>/dev/null; then
      echo "Please install required python packages" >&2
      echo "  $ sudo pip install xlsxwriter pycrypto" >&2
      exit 1
  fi
fi

echo "Creating build directory"
mkdir -p "${DIR}/build"
cd "${DIR}/build"

echo "Creating Makefiles"
CMAKE_OPTS="${CMAKE_OPTS} -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

# Honor CC and CXX environment variables, default to clang otherwise
CC=${CC:-clang}
CXX=${CXX:-clang++}

CMAKE_OPTS="$CMAKE_OPTS -DCMAKE_C_COMPILER=$CC"
CMAKE_OPTS="$CMAKE_OPTS -DCMAKE_ASM_COMPILER=$CC"
CMAKE_OPTS="$CMAKE_OPTS -DCMAKE_CXX_COMPILER=$CXX"

LINK=${LINK:-SHARED}
case $LINK in
    SHARED) CMAKE_OPTS="$CMAKE_OPTS -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF";;
    STATIC) CMAKE_OPTS="$CMAKE_OPTS -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON";;
esac

# Prefer ninja over make, if it is available
if command -v ninja >/dev/null; then
  CMAKE_OPTS="-G Ninja $CMAKE_OPTS"
fi

# shellcheck disable=SC2086
cmake $CMAKE_OPTS .. -B $1 -DCHAL:STRING=$2
#-Dchallenge_binaries=$1 

cmake --build $1