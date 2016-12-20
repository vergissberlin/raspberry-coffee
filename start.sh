#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Git deployment
cp -p /data/id_rsa.pub ~/.ssh/id_rsa.pub
cp -p /data/id_rsa ~/.ssh/id_rsa

# Start NodeRED
node-red-pi --max-old-space-size=128 --userDir /app/flows -v
