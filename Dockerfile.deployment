FROM gdekoenigsberg/showdown-openttd-base:latest
MAINTAINER Greg DeKoenigsberg<greg.dekoenigsberg@gmail.com>

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
