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
# Start application
#
messageInfo "Start the application"

# 1. Link pm2 to keymetrics
if printenv PM2_SECRET_KEY >/dev/null; then
	messageInfo "Link pm2 to keymetrics API and name instance resin DEVICE ID"
	pm2 link $PM2_SECRET_KEY $PM2_PUBLIC_KEY $HOSTNAME \
    && messageOk "PM2 is \"${blue}linked to keymetrics${norm}\"." \
    || messageError 65 "Error while linking pm2 to keymetrics."
else
	messageInfo "No keymetrics credentials defined."
fi

# 2. Start pm2
pm2 start /usr/bin/node-red \
 	--name ${APP_NAME} \
 	-- \
	-v \
	-s /usr/src/app/app/node-red/settings.js \
  --max-old-space-size=128 \
	    && messageOk "Start node-red with version \"${blue}${APP_NAME}${norm}\" successful." \
	    || messageError 1 "Error while start NodeRED."

# 3. Show status
${APP_BIN}/pm2 info ${APP_VERSION} \
    && messageOk "Show status of application \"${blue}${APP_VERSION}${norm}\" successful." \
    || messageError 1 "Error while showing application status."

exit 0;
