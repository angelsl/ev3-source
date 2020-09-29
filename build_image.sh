#!/bin/bash

set -euxo pipefail

SCRIPT_DIR="$(dirname "$(realpath -s "${BASH_SOURCE[0]}")")"
cd "$SCRIPT_DIR"

cd image
cp ../build-ev3/{sling,sinter_host} .

docker build -t sourceacademy/ev3-source .

TMPDIR=$(mktemp -d)
TARFILE="$TMPDIR/ev3-source.tar"
IMGFILE="$TMPDIR/ev3-source.img"

bash "$SCRIPT_DIR/brickstrap.sh" create-tar sourceacademy/ev3-source "$TARFILE"

docker rmi sourceacademy/ev3-source

export BRICKSTRAP_IMAGE_FILE_SIZE=$(echo $(($(du -m "$TARFILE" | cut -f1)*6/4+100)) | cut -d. -f1)M
echo 'Using BRICKSTRAP_IMAGE_FILE_SIZE='$BRICKSTRAP_IMAGE_FILE_SIZE

bash "$SCRIPT_DIR/brickstrap.sh" create-image "$TARFILE" "$IMGFILE"
rm "$TARFILE"

mv "$IMGFILE" "$SCRIPT_DIR"
rm -rf "$TMPDIR"
>&2 echo "Image created at $SCRIPT_DIR/$(basename "$IMGFILE")"
