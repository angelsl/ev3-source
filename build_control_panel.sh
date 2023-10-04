#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
REPO_DIR="ev3dev-service-control"
IMAGE_NAME="sourceacademy/ev3-vala-compiler"

cd "$SCRIPT_DIR/$REPO_DIR"
docker build -t "$IMAGE_NAME" .

cd "$SCRIPT_DIR"
mkdir -p build-ev3/executables
docker run --rm  -v "$(realpath "$SCRIPT_DIR")":/src -w /src -u 0:0 "$IMAGE_NAME" -o build-ev3/executables/service_control "$REPO_DIR/main.vala"

# Clean up
docker rmi "$IMAGE_NAME"
