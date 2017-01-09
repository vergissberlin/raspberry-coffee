#!/bin/bash
set -o errexit

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Install dependencies
apt-get update &&\
apt-get install \
    git-core \
    python-rpi.gpio \
    nodered \
    wireless-tools \
    firmware-ralink \
    sox \
    libsox-fmt-all \
    festival \
    festival-doc \
    festival-freebsoft-utils

# Update node
npm install -g npm
npm cache clean -f
npm install -g n
n stable
hash -r

# Configure node
npm config set unsafe-perm true -g --unsafe-perm

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
