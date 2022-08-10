#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"
REPO_DIR="uuidtob62"

docker run --rm -v "$(realpath "$SCRIPT_DIR")/$REPO_DIR":/usr/src/uuidtob62 -w /usr/src/uuidtob62 -e GOOS=linux -e GOARCH=arm -e GOARM=5 golang:1.17 go build -v -o uuidtob62

cd "$SCRIPT_DIR"
mkdir -p build-ev3/executables
cp "$REPO_DIR/uuidtob62" build-ev3/executables/
