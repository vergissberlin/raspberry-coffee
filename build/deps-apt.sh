#!/bin/bash
set -o errexit

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Install dependencies
apt-get update &&\
apt-get install \
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
    wireless-tools
