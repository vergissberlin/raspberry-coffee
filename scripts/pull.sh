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


# 2. Create backup
cat /app/.node-red/flows_coffee.json > /app/.node-red/flows_backup.json &&\

# 3. Copy flow file
cat /app/flows/config/flows_coffee.json > /app/.node-red/flows_coffee.json &&\

# 4. Restart node-red
sudo service nodered restart &&\

exit 0;
