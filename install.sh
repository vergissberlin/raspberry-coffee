#!/bin/bash

# Install NodeRED
sudo apt-get update
sudo apt-get install nodered

# Start NodeRED on startup
sudo systemctl enable nodered.service``

# Update node
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

# Install additional nodes
sudo apt-get install npm
sudo npm install -g npm@2.x
hash -r
cd ~/.node-red
npm i node-red-node-pibrella node-red-node-xmpp node-red-node-feedparser
