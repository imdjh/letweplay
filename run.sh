#!/bin/bash

WEPLAY_PORT=3000 WEPLAY_IO_URL="http://159.203.3.193:3001" WEPLAY_REDIS="159.203.3.193:6379" forever /srv/weplay-web/index.js 
