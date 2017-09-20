#!/bin/bash
set -o errexit

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Directories
mkdir -p ~/.ssh

# Install dependencies
apt-get update &&\
apt-get install \
		curl \
		git-core \
    firmware-ralink \
    festival \
    festival-doc \
    festival-freebsoft-utils \
    libsox-fmt-all \
    mc \
    nodered \
    python-rpi.gpio \
    sox \
    vim \
		wget \
    wireless-tools

# Current nodejs version
npm cache clean -f
npm install -g n
n stable

# Node-RED
npm install -g node-red

# Configure dependencies
echo -e "\nsyntax on\nset background=dark\nset mouse=a\n" >> /etc/vim/vimrc
