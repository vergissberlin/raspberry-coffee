#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Backup flow
cp -u /usr/src/app/app/node-red/flows.json /data/backup/node-red/flows.json

# 2. Backup credentials
if [ -e "/usr/src/app/app/node-red/flows_cred.json" ]
  then
    cp -u /usr/src/app/app/node-red/flows_cred.json /data/backup/node-red/flows_cred.json
  else
    echo "No credentials found."
fi
