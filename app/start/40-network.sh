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

validateEnvironment APP_NAME

########################################################################################################################
# Configure network
#
messageInfo "Configure network"

echo ${APP_NAME} > /etc/hostname \
			&& messageOk "Set hostname to \"${blue}${APP_NAME}${norm}\" successful." \
			|| messageError 65 "Error while setup hostname."

echo "127.0.0.1 ${APP_NAME}" > /etc/hosts \
			&& messageOk "Set host in \"${blue}/etc/hosts${norm}\" successful." \
			|| messageError 65 "Error while setup host in hosts file."

exit 0;
