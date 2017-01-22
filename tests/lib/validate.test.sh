#!/bin/bash

# piball
#
# LICENSE:    MIT
#
# @project    piball
# @package    tests
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Include user interface and helper
. ./app/lib/console.sh
. ./app/lib/validate.sh

# Test arguments validation
validateArguments $# 2 "Usage: ${code} 31-nodered-install.sh ${bold_begin}FOO BAR${bold_end} ${norm}"


# Test environment variable validation
export ENV_EXIST="Dirk"
validateEnvironment ENV_EXIST
validateEnvironment ENV_NOT_EXIST
