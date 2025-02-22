#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})
CWD=$(pwd)

if sudo -v; then
    sudo apt-get update -qy
    sudo apt-get -qy install \
        emacs
fi

echo "Setting up emacs configuration."
ln -s -f ${CWD}/emacs.el ${HOME}/.emacs
