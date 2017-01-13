#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Update repository
cd /data/raspberry-coffee &&\
git checkout docker &&\
git pull &&\

# 2. Create backup
cat /usr/src/app/node-red/flows.json > /usr/src/app/node-red/flows_backup.json &&\

# 3. Copy flow file
cat /data/raspberry-coffee/node-red/flows.json > /usr/src/app/node-red/flows.json &&\

# 4. Restart container
init 6
