#!/bin/bash
set -o errexit

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Update node
npm install -g npm
npm cache clean -f
npm install -g n
n stable
hash -r

# Configure node
npm config set unsafe-perm true -g --unsafe-perm
