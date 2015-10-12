#!/bin/bash

# MAGICs
export WEPLAY_WEB_PORT=3000
export WEPLAY_IO_URL="${IO_URL_PORT:-BAD}"

if [[ -n "${REDIS_PORT}" ]];then
    export WEPLAY_REDIS_URI=${REDIS_PORT_6379_TCP_ADDR}:${REDIS_PORT_6379_TCP_PORT}
    # REDIS_PASSWORD is daocloud MAGIC
    export WEPLAY_REDIS_AUTH=${REDIS_PASSWORD}
else
    echo "Redis setting not found, can't start server." >&2 && exit 1
fi

if ( $(echo ${WEPLAY_IO_URL} | grep -q BAD ) );then
    echo "IO_URL_PORT is missing, can't start entry server." >&2 && exit 1
fi

forever start /srv/weplay-web/index.js
forever start /srv/weplay/index.js

# MAGIC
tail -f /root/.forever/*.log
