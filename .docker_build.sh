#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"

mkdir -p build-ev3
cd build-ev3
cmake "$SCRIPT_DIR/sling/linux" \
  -DCMAKE_BUILD_TYPE=Release \
  -DSLING_SINTERHOST_CUSTOM_SOURCES=../deps/sinter/devices/ev3/src/ev3_functions.c \
  -DSLING_SINTERHOST_CUSTOM=../../../host_custom.c \
  -DSLING_SINTERHOST_PRERUN=../../../host_prerun.c \
  -DCMAKE_TOOLCHAIN_FILE=/home/compiler/toolchain-armel.cmake
make -j$(nproc)
