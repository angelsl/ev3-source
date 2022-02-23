#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"
REPO_DIR="go_ev3_qrcode_generator"

docker run --rm -v "$(realpath "$SCRIPT_DIR")/$REPO_DIR":/usr/src/qrcode -w /usr/src/qrcode -e GOOS=linux -e GOARCH=arm -e GOARM=5 golang:1.17 go build -v -o show_qrcode

cd "$SCRIPT_DIR"
mkdir -p build-ev3/executables
cp "$REPO_DIR/show_qrcode" build-ev3/executables/
