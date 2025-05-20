#!/bin/bash -eu

## define variables
readonly COMMAND="/usr/local/bin/brew"

## main
if [ ! -e ${COMMAND} ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> ${HOME}/.bash_profile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.bash_profile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ${COMMAND} doctor && ${COMMAND} update && ${COMMAND} bundle
else
    echo "Initialization has already been completed."
fi
