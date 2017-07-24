#!/bin/bash -eu

## define variables
readonly COMMAND="/usr/local/bin/brew"

## main
if [ ! -e ${COMMAND} ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ${COMMAND} doctor && ${COMMAND} update && ${COMMAND} tap Homebrew/bundle && ${COMMAND} bundle
else
    echo "Initialization has already been completed."
fi
