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
apt-get update && apt-get install git-core python-rpi.gpio nodered firmware-ralink

# Update node
npm install -g npm@2.x
npm cache clean -f
npm install -g n
n stable
hash -r

# Install additional nodes
cd /usr/src/app/node-red/
npm i node-red-node-pibrella node-red-node-feedparser node-red-node-xmpp
