#!/bin/bash

export WEPLAY_PORT=3001
export WEPLAY_WEB_PORT=3001
export WEPLAY_IO_URL="http://localhost:3001"
ENV WEPLAY_SERVER_UID 1337
ENV WEPLAY_IP_THROTTLE 50

if [ ! -z "${REDIS_PORT_6379_TCP_ADDR}" ];then
    export WEPLAY_PORT=${REDIS_PORT_6379_TCP_ADDR}:${REDIS_PORT_6379_TCP_PORT}
fi


forever /srv/weplay-web/index.js 
