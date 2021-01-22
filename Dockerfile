FROM ubuntu:18.04
MAINTAINER Greg DeKoenigsberg<greg.dekoenigsberg@gmail.com>

ARG OPENTTD_VERSION="1.10.3"
ARG OPENGFX_VERSION="0.6.0"
ADD prepare.sh /tmp/prepare.sh
ADD cleanup.sh /tmp/cleanup.sh
ADD buildconfig /tmp/buildconfig
ADD --chown=1000:1000 openttd.sh /openttd.sh

RUN chmod +x /tmp/prepare.sh /tmp/cleanup.sh /openttd.sh
RUN /tmp/prepare.sh \
    && /tmp/cleanup.sh

# Now add content later -- does it work?
ADD content/ai /home/openttd/ai
ADD content/content_download /home/openttd/content_download
ADD content/hotkeys.cfg /home/openttd/hotkeys.cfg
ADD content/scripts /home/openttd/scripts
ADD content/openttd.cfg /home/openttd/openttd.cfg
ADD simple-scenario.scn /home/openttd/simple-scenario.scn

VOLUME /home/openttd/.openttd

EXPOSE 3979/tcp
EXPOSE 3979/udp

STOPSIGNAL 3
ENTRYPOINT [ "/usr/bin/dumb-init", "--rewrite", "15:3", "--rewrite", "9:3", "--" ]
CMD [ "/openttd.sh" ]
