#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"
docker build -f Dockerfile.sling -t sourceacademy/ev3-source-build .
docker run --rm -it -v "$(realpath "$SCRIPT_DIR")":/src -w /src -u 0:0 --entrypoint /src/.docker_entrypoint.sh sourceacademy/ev3-source-build
