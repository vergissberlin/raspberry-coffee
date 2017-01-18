#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# 1. Set git configuration
git config --global push.default matching &&\
git config --global user.name $GIT_NAME &&\
git config --global user.email $GIT_EMAIL &&\

# 2. Generate ssh key
cat /dev/zero | ssh-keygen -q -N "" &&\
cat /root/.ssh/id_rsa.pub &&\

# 3. Store ssh key on persitent mount
cp -f /root/.ssh/id_rsa /data/ssh/id_rsa &&\
cp -f /root/.ssh/id_rsa.pub /data/ssh/id_rsa.pub &&\

# 4. Clone repository
cd /data &&\
git clone git@github.com:vergissberlin/raspberry-coffee.git &&\
cd raspberry-coffee &&\
git checkout docker &&\
git branch --set-upstream-to=origin/docker
