 #!/bin/bash
set -o errexit

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Install NodeRED
apt-get update
apt-get install git mc nodered

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
cd ~/.node-red
npm i node-red-node-pibrella node-red-node-xmpp node-red-node-feedparser
npm i -g -unsafe-perm node-red


# Install additional nodes
sudo apt-get install npm
sudo npm install -g npm@2.x
hash -r
cd ~/.node-red
npm i node-red-node-pibrella node-red-node-xmpp node-red-node-feedparser
