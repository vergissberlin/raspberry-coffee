#!/bin/bash

# coffee-bin
#
# LICENSE:    MIT
#
# @project    coffee-bin
# @package    library
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Colour definitions
red='\033[01;31m'
blue='\033[01;34m'
green='\033[01;32m'
yellow='\033[01;35m'
orange='\033[38;5;;172m'
norm='\033[0m'
code='\033[40m'

# Styling definitions
bold_begin='\033[1m'
bold_end='\033[21m'


# Message
function messageError {
	echo -e "[${bold_begin}${red}erro${norm}${bold_end}]\t${@:2}"
	exit $1;
}

function messageWarn {
	echo -e "[${bold_begin}${orange}warn${norm}${bold_end}]\t$*"
}

function messageOk {
	echo -e "[ ${bold_begin}${green}ok${norm}${bold_end} ]\t$*"
}

function messageInfo {
	echo -e "[${bold_begin}${blue}info${norm}${bold_end}]\t$*"
}

function messageCode {
	echo -e "[${yellow}code${norm}]\t${code} $* ${norm}"
}
