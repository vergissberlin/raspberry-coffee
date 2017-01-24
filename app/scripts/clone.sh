#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

# Clone repository
cd /data &&\
git clone ${GIT_REPOSITORY} &&\
cd ${APP_NAME} &&\
git checkout ${GIT_BRANCH} &&\
git branch --set-upstream-to=origin/${GIT_BRANCH}
