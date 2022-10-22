#!/bin/bash

set -euxo pipefail
SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
IMAGE_NAME="sourceacademy/rtl8821cu"
OUTPUT_DIR="image/rtl8821cu-driver"

cd rtl8821cu-driver
docker build -t "$IMAGE_NAME" .

cd "$SCRIPT_DIR"
mkdir -p "$OUTPUT_DIR"
cd "$OUTPUT_DIR"
docker run --rm -w /root/work/rtl8821cu/ "$IMAGE_NAME" cat 8821cu.ko > 8821cu.ko
docker run --rm -w /root/work/rtl8821cu/ "$IMAGE_NAME" cat 8821cu.conf > 8821cu.conf

# Clean up
docker rmi "$IMAGE_NAME"
