#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Update repository
cd /data/rasberry-coffee &&\
git checkout master &&\
git pull &&\

# 2. Copy flow file
cat /usr/src/app/node-red/flows.json > /data/rasberry-coffee/node-red/flows.json &&\

# 3. Add and commit changes
git add node-red/flows.json &&\
git commit -am "Deploy new flow from Raspberry PI" >> /data/deploy.log &&\

# 4. Push and log
git push >> /data/deploy.log &&\

exit 0;
