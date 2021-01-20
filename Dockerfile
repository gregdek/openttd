FROM ubuntu:18.04
MAINTAINER Greg DeKoenigsberg<greg.dekoenigsberg@gmail.com>
# Old MAINTAINER Mats Bergmann <bateau@sea-shell.org>

ARG OPENTTD_VERSION="1.10.3"
ARG OPENGFX_VERSION="0.6.0"

ADD prepare.sh /tmp/prepare.sh
ADD cleanup.sh /tmp/cleanup.sh
ADD buildconfig /tmp/buildconfig
ADD simple-scenario.scn /home/openttd/simple-scenario.scn
ADD ubuntu-host /home/openttd/ubuntu-host
ADD --chown=1000:1000 openttd.sh /openttd.sh

RUN chmod +x /tmp/prepare.sh /tmp/cleanup.sh /openttd.sh
RUN /tmp/prepare.sh \
    && /tmp/cleanup.sh

VOLUME /home/openttd/.openttd

EXPOSE 3979/tcp
EXPOSE 3979/udp

STOPSIGNAL 3
ENTRYPOINT [ "/usr/bin/dumb-init", "--rewrite", "15:3", "--rewrite", "9:3", "--" ]
CMD [ "/openttd.sh" ]
