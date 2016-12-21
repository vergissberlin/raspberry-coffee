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
apt-get update
apt-get install git mc -y

# Configure git
git config --global push.default matching
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

# Update node
npm install -g npm@2.x
npm cache clean -f
npm install -g n
n stable
hash -r

# Install NodeRED
npm i -g -unsafe-perm node-red

# Install additional nodes
cd ~/.node-red
npm i node-red-node-pibrella node-red-node-xmpp node-red-node-feedparser
