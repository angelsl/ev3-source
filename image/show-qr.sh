#!/bin/bash

echo -en 'Content-Type: image/png\n\n'
cat /var/lib/sling/secret_image.png || echo ''
echo ''