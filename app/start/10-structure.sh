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
	|| messageInfo "SSH directory allready exists."

mkdir -p /data/ssh \
  	&& messageOk "Persistent ssh directory created." \
		|| messageInfo "Persistent ssh directory allready exists."

mkdir -p /data/backup/node-red \
	&& messageOk "Backup directory created." \
	|| messageInfo "Backup directory allready exists."

mkdir -p /data/log \
	&& messageOk "Log directory created." \
	|| messageInfo "Log directory allready exists."

exit 0;
