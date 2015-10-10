#!/bin/bash

export  WEPLAY_PORT 3000
export  WEPLAY_IO_URL "http://159.203.3.193:3001"
export  WEPLAY_REDIS "159.203.3.193:6379"

forever start /srv/weplay-web/index.js 
tail -f root/.forever/*.log
