#!/bin/bash
set -e

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
# Install dependencies
#

/bin/bash ${APP_SRC}/build/10-deps-apt.sh
/bin/bash ${APP_SRC}/build/20-deps-node-update.sh
/bin/bash ${APP_SRC}/build/30-deps-node-modules.sh

exit 0;
