FROM ev3dev/ev3dev-stretch-ev3-base
# Copy our own binaries
COPY executables/uuidtob62 sling sinter_host /usr/local/bin/

# Copy WiFi drivers
COPY rtl8821cu-driver/8821cu.conf /etc/modprobe.d/
COPY rtl8821cu-driver/8821cu.ko /lib/modules/4.14.117-ev3dev-2.3.5-ev3/drivers/net/wireless/

# Copy configurations and run setup
COPY bootstrap.sh start-sling.sh sling.service panel.service show-secret.sh show-qr.sh /usr/local/bin/
RUN ["bash", "-c", "chmod 755 /usr/local/bin/bootstrap.sh && exec /usr/local/bin/bootstrap.sh"]

# Copy user-executable binaries
ARG show_qrcode="Show QR Code"
ARG nus_login="Login to NUS_STU"
COPY executables/${show_qrcode} executables/${nus_login} /home/robot/
RUN ["bash", "-c", "chmod 755 \"/home/robot/${show_qrcode}\" \"/home/robot/${nus_login}\""]
