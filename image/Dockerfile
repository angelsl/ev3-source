FROM ev3dev/ev3dev-stretch-ev3-base
COPY sling sinter_host start-sling.sh bootstrap.sh sling.service panel.service show-secret.sh /usr/local/bin/
RUN ["bash", "-c", "chmod 755 /usr/local/bin/bootstrap.sh && exec /usr/local/bin/bootstrap.sh"]
