#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Backup settings
cp -f /data/node-red/flows_cred.json /data/backup/node-red/flows_cred.json

# 2. Backup flow
cp -f /data/node-red/flows.json /data/backup/node-red/flows.json
