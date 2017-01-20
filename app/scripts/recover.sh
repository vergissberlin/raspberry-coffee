#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Recover settings
cp -f /data/backup/node-red/flows_cred.json /usr/src/app/app/node-red/flows_cred.json

# 2. Recover flow
cp -f /data/backup/node-red/flows.json /usr/src/app/app/node-red/flows.json
