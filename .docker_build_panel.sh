#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR/lwan"

. "$SCRIPT_DIR/.modify_lwan_cmakelists.sh"

mkdir -p build-ev3
cd build-ev3

cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/home/compiler/toolchain-armel.cmake
make -j$(nproc) panel
