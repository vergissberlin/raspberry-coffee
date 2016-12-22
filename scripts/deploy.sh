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

# 2. Copy flow file
cat /usr/src/app/node-red/flows.json > node-red/flows.json &&\

# 3. Add and commit changes
git add node-red/flows.json &&\
git commit -am "Deploy new flow from Raspberry PI" >> /data/deploy.log &&\

# 4. Push and log
git push -u >> /data/deploy.log &&\

exit 0;
