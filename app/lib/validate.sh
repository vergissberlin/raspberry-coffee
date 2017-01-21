#!/bin/bash

# coffee-bin
#
# LICENSE:    MIT
#
# @project    coffee-bin
# @package    library
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT


# Check count of arguments
#
# @return void
function validateArguments {
	if [ $1 -ne $2 ]
	then
		messageError 65 $3
	fi
}

# Check count of arguments
#
# @return void
function validateEnvironment {
	if printenv $1 >/dev/null; then
			messageOk "Variable ${blue}${1}${norm} is set to some string."
	else
			messageError 65 "Variable ${blue}${1}${norm} is not set."
	fi
}
