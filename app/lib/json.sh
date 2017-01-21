#!/bin/bash

# coffe-bin
#
# LICENSE:    MIT
#
# @project    coffee-bin
# @package    deployment
# @author     André Lademann <vergissberlin@googlemail.com>
# @copyright  coffee-bin.io
# @license    http://opensource.org/licenses/MIT

function jsonValue() {
	KEY=$1
	num=$2
	awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | tr -d '[[:space:]]' | sed -n ${num}p
}

function packageValue() {
  cat ${APP_SRC}/package.json|jsonValue $1
}

$1 $2
