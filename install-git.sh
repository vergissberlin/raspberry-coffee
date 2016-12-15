#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

cd

# Deployment with git
# If you wanna use git to save your flows,
# you have to install _git_ and create a _key_

sudo apt update
sudo apt install git-core``
ssh-keygen
echo "Add the generated key to your deployment key list on your repository server\n"
cat .ssh/id_rsa.pub
read -p "Did you have added the SSH key to your git server? y/n "
if [ "$name" != "y" ]; then
  exit 1;
fi

git config --global push.default matching

# User settings
read -p "What's you name? " name
if [ "$name" != "" ]; then
  git config --global user.name "$name"
fi

read -p "What is your git email address? " email
if [ "$email" != "" ]; then
  git config --global user.email $email
fi

read -p "What's the git url? " url
if [ "$url" != "" ]; then
  git clone $url ~/flows

fi
