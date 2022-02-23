#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"
REPO_DIR="ev3-prompt-nusnet-credentials/vala"

mkdir -p build-ev3/executables

docker build -t sourceacademy/ev3-vala-compiler - < Dockerfile.prompt
docker run --rm  v "$(realpath "$SCRIPT_DIR")":/src -w /src -u 0:0 sourceacademy/ev3-vala-compiler -o build-ev3/executables/nus_login "$REPO_DIR/main.vala"
