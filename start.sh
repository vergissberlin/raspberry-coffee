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
cp -n /data/id_rsa.pub ~/.ssh/id_rsa.pub
cp -n /data/id_rsa ~/.ssh/id_rsa
ssh-keyscan github.com > ~/.ssh/known_hosts

# Restore credentials
cp -n /data/flows_cred.json /usr/src/app/node-red/flows_cred.json

# Start NodeRED
node-red-pi --max-old-space-size=128 --userDir /usr/src/app/node-red -v
