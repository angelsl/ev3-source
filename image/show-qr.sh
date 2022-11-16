#!/bin/bash

if [ "$(cat .enable)" == '0' ]; then
    echo "Not Authorized."
else
    echo -en 'Content-Type: image/png\n\n'
    cat /var/lib/sling/secret_image.png || echo ''
    echo ''
fi
