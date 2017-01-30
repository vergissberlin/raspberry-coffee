#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

if printenv GIT_REPOSITORY >/dev/null; then
  # 1. Set git configuration
  git config --global push.default matching &&\
  git config --global user.name $GIT_NAME &&\
  git config --global user.email $GIT_EMAIL &&\

  # 2. Generate ssh key
  cat /dev/zero | ssh-keygen -q -N "" &&\
  cat /root/.ssh/id_rsa.pub &&\

  # 3. Store ssh key on persitent mount
  cp -u /root/.ssh/id_rsa /data/ssh/id_rsa &&\
  cp -u /root/.ssh/id_rsa.pub /data/ssh/id_rsa.pub &&\
else
  echo "Please set the environment Varialbes for git deployment!";
  exit 1;
fi
