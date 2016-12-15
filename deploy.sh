#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Update repository
cd ~/flows &&\
git checkout master &&\
git pull &&\

# 2. Copy flow file
cat ~/.node-red/flows_coffee.json > ~/flows/flows_coffee.json &&\

# 3. Add and commit changes
git add ~/.node-red/flows_coffee.json &&\
git commit -m "Deploy new flow from Raspberry PI" >> ~/deploy.log &&\

# 4. Push and log
git push >> ~/deploy.log &&\

exit 0;
