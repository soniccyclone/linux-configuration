#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})
CWD=$(pwd)

if sudo -v; then
    sudo dnf -qy install \
        emacs
fi

echo "Setting up emacs configuration."
ln -s -f ${CWD}/emacs.el ${HOME}/.emacs
