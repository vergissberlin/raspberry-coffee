#!/bin/bash

# Coffee counter
#
# LICENSE:    MIT
#
# @project    coffee
# @package    app
# @author     André Lademann <vergissberlin@googlemail.com>

########################################################################################################################
# Include user interface and helper
#
. ${APP_SRC}/app/lib/console.sh
. ${APP_SRC}/app/lib/validate.sh

validateEnvironment APP_SRC
validateEnvironment APP_NAME
validateEnvironment PM2_SECRET_KEY
validateEnvironment PM2_PUBLIC_KEY
validateEnvironment RESIN_DEVICE_UUID

########################################################################################################################
# Config
#
messageInfo "Config npm"

/usr/local/bin/npm config set loglevel silent \
	&& messageOk "Node only show warnings and errors." \
	|| messageError 1 "Something went wrong on config npm."



########################################################################################################################
# Start packages
#
messageInfo "Starting pm2"

# Link pm2 to keymetrics API and name instance resin DEVICE ID
pm2 link $PM2_SECRET_KEY $PM2_PUBLIC_KEY $RESIN_DEVICE_UUID

# Start pm2 process to run NodeRED forever
pm2 start /usr/bin/node-red \
 	--name ${APP_NAME} \
 	-- \
	-v \
	-s /usr/src/app/app/node-red/settings.js \
  --max-old-space-size=128 \
	    && messageOk "Start node-red with version \"${blue}${APP_NAME}${norm}\" successful." \
	    || messageError 1 "Error while start NodeRED."

pm2 info ${APP_NAME}

exit 0;
