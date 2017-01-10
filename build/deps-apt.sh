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
    python-rpi.gpio \
    nodered \
    wireless-tools \
    firmware-ralink \
    sox \
    libsox-fmt-all \
    festival \
    festival-doc \
    festival-freebsoft-utils
