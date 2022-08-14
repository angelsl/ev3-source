#!/bin/bash

echo 'Content-Type: text/html'
echo ''

SECRET=$(cat /var/lib/sling/secret_b62 || echo 'Unable to read secret')

echo '<!DOCTYPE html><title>EV3 Device Panel</title><style>input { width: 50%; }</style>Your device secret is: <input readonly value='"'$SECRET'"'>'

echo '<img src='"'/cgi-bin/qr.cgi'"' alt='"'Please run show_qrcode to generate the QR code.'"'>'
