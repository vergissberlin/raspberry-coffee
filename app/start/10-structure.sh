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


########################################################################################################################
# Directories
#

messageInfo "Create directories"

mkdir -p ~/.ssh \
	&& messageOk "SSH directory created." \
	|| messageError 1 "Something went wrong on creating ssh directory."

mkdir -p /data/ssh \
  	&& messageOk "Persistent ssh directory created." \
  	|| messageError 1 "Something went wrong on creating persistent ssh directory."

mkdir -p /data/backup/node-red \
	&& messageOk "Backup directory created." \
	|| messageError 1 "Something went wrong on creating backup directory."

mkdir -p /data/log \
	&& messageOk "Log directory created." \
	|| messageError 1 "Something went wrong on creating log directory."


exit 0;
