#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Bus
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Git deployment
mkdir -p ~/.ssh
cp -n /data/id_rsa.pub ~/.ssh/id_rsa.pub
cp -n /data/id_rsa ~/.ssh/id_rsa
ssh-keyscan github.com > ~/.ssh/known_hosts

# Restore credentials
cp -n /data/flows_cred.json /usr/src/app/node-red/flows_cred.json

# Link pm2 to keymetrics API and name instance resin DEVICE ID
pm2 link $SECRET_KEY $PUBLIC_KEY $RESIN_DEVICE_UUID

# Start pm2 process to run NodeRED forever
pm2 start /usr/bin/node-red --node-args="--max-old-space-size=128  --userDir=/usr/src/app/node-red" -- -v

# Print info
pm2 info node-red

# Spit out some logs
pm2 logs
