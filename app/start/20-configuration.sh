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

validateEnvironment SYSTEM_TIMEZONE
validateEnvironment APP_SRC

########################################################################################################################
# GIT
#
if (printenv GIT_NAME >/dev/null) && (printenv GIT_EMAIL >/dev/null); then

	messageInfo "Setup git"

	/usr/bin/git config --global user.name ${GIT_NAME} \
		&& messageOk "Set git user name." \
		|| messageError 1 "Something went wrong on set git user name."

	/usr/bin/git config --global user.email ${GIT_EMAIL} \
		&& messageOk "Set git user email address." \
		|| messageError 1 "Something went wrong on set git user email."

	/usr/bin/git config --global push.default simple \
			&& messageOk "Set git push method." \
			|| messageError 1 "Something went wrong on setup git push method."

	# SSH
	messageInfo "Copy ssh keys"

	cp -n /data/ssh/id_rsa.pub ~/.ssh/id_rsa.pub \
			&& messageOk "Public ssh key copied." \
			|| messageInfo 1 "No newer public ssh key founded."

	cp -n /data/ssh/id_rsa ~/.ssh/id_rsa \
			&& messageOk "Private ssh key copied." \
			|| messageInfo 1 "No newer private ssh key founded."

	ssh-keyscan github.com > ~/.ssh/known_hosts \
			&& messageOk "Added github to known hosts file." \
			|| messageError 1 "Could not add github to known hosts file."

fi


########################################################################################################################
# Config
#

messageInfo "Restore newer flows"

cp -u /data/node-red/flows.json ${APP_SRC}/app/node-red/flows.json \
		&& messageOk "Newer flow copied." \
		|| messageInfo 1 "No newer flow founded."

cp -u /data/node-red/flows_cred.json ${APP_SRC}/app/node-red/flows_cred.json \
		&& messageOk "Newer flow credentials copied." \
		|| messageInfo 1 "No newer flow credentials founded."


messageInfo "Configure time zone"

echo "${SYSTEM_TIMEZONE}" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata  \
	&& messageOk "Set time zone to ${code}${SYSTEM_TIMEZONE}${norm}." \
	|| messageError 1 "Something went wrong on set time zone."

exit 0;
