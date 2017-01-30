#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>

if printenv GIT_REPOSITORY >/dev/null; then

  # 1. Update repository
  cd /data/${APP_NAME} &&\
  git checkout ${GIT_BRANCH} &&\
  git pull &&\

  # 2. Create backup
  /bin/bash /usr/src/app/app/scripts/backup.sh &&\

  # 3. Copy flow file
  cat /data/${APP_NAME}/app/node-red/flows.json > /usr/src/app/app/node-red/flows.json &&\

  # 4. Restart Node-RED
  pm2 restart ${APP_NAME}

else
  echo "Please set the environment Varialbes for git deployment!";
  exit 1;
fi

exit 0;
