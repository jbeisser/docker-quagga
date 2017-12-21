FROM alpine:latest
#VOLUME ["/config", "/logs"]
RUN set -ex; \
mkdir /config ; \
mkdir /logs ; \
mkdir /etc/s6 ; \
mkdir /etc/s6/zebra ; \
mkdir /etc/s6/bgpd ;
COPY files/00-local.conf /etc/sysctl.d
COPY files/bgpd.conf /config
COPY files/zebra.conf /config
COPY files/s6-zebra-run /etc/s6/zebra/run
COPY files/s6-bgpd-run /etc/s6/bgpd/run
RUN set -ex; \
apk update && apk add --no-cache \
su-exec \
s6 \
quagga \
openrc \
bash ; \
chown quagga:quagga /config ; \
chown quagga:quagga /logs ; \
chown quagga:quagga /config/*.conf ;
# ensure BGP and such are exposed
EXPOSE 179 2600 2601 2602 2603 2604 2605 2606 2607 2608
ENTRYPOINT ["/bin/s6-svscan", "/etc/s6"]

