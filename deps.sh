#!/bin/bash
set -o errexit
apt-get update && apt-get install git-core python-rpi.gpio nodered
npm install -g npm@2.x
npm cache clean -f
npm install -g n
n stable
hash -r
# npm i -g -unsafe-perm node-red
mkdir -p ~/.node-red
cd /usr/src/app/node-red/
npm i node-red-node-pibrella node-red-node-feedparser

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Install dependencies
# apt-get update
# apt-get install git-core

# Configure git
# git config --global push.default matching
# git config --global user.name $GIT_NAME
# git config --global user.email $GIT_EMAIL

# Update node
#npm install -g npm@2.x
#npm cache clean -f
#npm install -g n
#n stable
#hash -r

# Check node version
#node -v
#npm -v

# Install NodeRED
#npm i -g node-red

# Install additional nodes
#mkdir -p ~/.node-red
#cd ~/.node-red
#npm i node-red-node-pibrella node-red-node-xmpp node-red-node-feedparser
