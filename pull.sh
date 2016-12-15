#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Update repository
cd ~/coffee &&\
git checkout master &&\
git pull &&\


# 2. Create backup
cat ~/.node-red/flows_piball.json > ~/.node-red/flows_backup.json &&\

# 3. Copy flow file
cat node-red/flows_piball.json > ~/.node-red/flows_piball.json &&\

# 4. Restart node-red
pm2 restart node-red

exit 0;
