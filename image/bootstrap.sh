#!/bin/bash

set -euxo pipefail

SCRIPT_PATH="$(realpath -s "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

# allow passwordless sudo for robot
echo "robot ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/robot

# stop sudo from doing a DNS lookup -- ensures executables can be run when network is down
echo -e "Defaults\t!fqdn" >> /etc/sudoers

# install sling.service, set permissions
mv /usr/local/bin/sling.service /usr/local/bin/panel.service /etc/systemd/system/
chmod 644 /etc/systemd/system/sling.service /etc/systemd/system/panel.service
systemctl enable sling.service panel.service

# set permissions to our executables
chmod 755 /usr/local/bin/sling /usr/local/bin/sinter_host /usr/local/bin/start-sling.sh

# disable systemd-resolved
systemctl disable systemd-resolved.service

# add sling data directory
mkdir -p /var/lib/sling
chmod 755 /var/lib/sling
chown robot:robot /var/lib/sling

# install uuidgen
cd /dev/shm
curl -LO http://cdn-fastly.deb.debian.org/debian/pool/main/u/util-linux/uuid-runtime_2.29.2-1+deb9u1_armel.deb
curl -LO http://cdn-fastly.deb.debian.org/debian/pool/main/b/busybox/busybox-static_1.22.0-19+b3_armel.deb
dpkg -i uuid-runtime_2.29.2-1+deb9u1_armel.deb
dpkg -i busybox-static_1.22.0-19+b3_armel.deb
systemctl disable uuidd.socket
rm uuid-runtime_2.29.2-1+deb9u1_armel.deb busybox-static_1.22.0-19+b3_armel.deb

# make journald log to memory only
cat <<EOF > /etc/systemd/journald.conf
[Journal]
Storage=volatile
RuntimeMaxUse=4M
EOF

# make cgi-bin
mkdir -p /srv/www/cgi-bin
mv /usr/local/bin/show-secret.sh /srv/www/cgi-bin/index.cgi
chmod 755 /srv/www/cgi-bin/index.cgi

# delete ourselves
rm -f "$SCRIPT_PATH"
