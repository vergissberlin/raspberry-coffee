#!/bin/bash
set -o errexit

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Install additional nodes
cd /usr/src/app/node-red/
npm i \
    node-red-node-pibrella \
    node-red-contrib-resinio \
    node-red-node-feedparser \
    node-red-node-xmpp \
    node-red-contrib-say \
    node-red-contrib-play \
    node-red-contrib-debounce

# Install process manager
npm i pm2 -g --no-optional
pm2 install pm2-server-monit
