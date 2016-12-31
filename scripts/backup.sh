#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Backup settings
cp -f /usr/src/app/node-red/flows_cred.json /data/flows_cred.json

# 2. Backup flow
cp -f /usr/src/app/node-red/flows.json /data/flows.json
