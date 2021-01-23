#!/bin/sh

set -x

PUID=${PUID:-911}
PGID=${PGID:-911}
PHOME=${PHOME:-"/home/openttd"}
USER=${USER:-"openttd"}

if [ ! "$(id -u ${USER})" -eq "$PUID" ]; then usermod -o -u "$PUID" ${USER} ; fi
if [ ! "$(id -g ${USER})" -eq "$PGID" ]; then groupmod -o -g "$PGID" ${USER} ; fi
if [ "$(grep ${USER} /etc/passwd | cut -d':' -f6)" != "${PHOME}" ]; then
        if [ ! -d ${PHOME} ]; then
                mkdir -p ${PHOME}
                chown ${USER}:${USER} ${PHOME}
        fi
        usermod -m -d ${PHOME} ${USER}
fi

echo "
-----------------------------------
GID/UID
-----------------------------------
User uid:    $(id -u ${USER})
User gid:    $(id -g ${USER})
User Home:   $(grep ${USER} /etc/passwd | cut -d':' -f6)
-----------------------------------
"

su -l openttd -c "/usr/games/openttd -D -g scenario/simple-scenario.scn -x -d ${DEBUG}"

