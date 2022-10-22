FROM --platform=amd64 ubuntu:20.04
COPY setup.sh /root
RUN ["bash", "-c", "chmod 755 /root/setup.sh && exec /root/setup.sh"]