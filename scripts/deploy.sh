#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Update repository
cd /app/flows &&\
git checkout master &&\
git pull &&\

# 2. Copy flow file
cat /app/.node-red/flows_coffee.json > /app/flows/config/flows_coffee.json &&\

# 3. Add and commit changes
git add config/flows_coffee.json &&\
git commit -am "Deploy new flow from Raspberry PI" >> /data/deploy.log &&\

# 4. Push and log
git push >> /data/deploy.log &&\

exit 0;
