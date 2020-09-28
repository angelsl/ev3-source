#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"

docker build -f Dockerfile.image -t sourceacademy/ev3-source .

