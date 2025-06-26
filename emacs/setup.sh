#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing emacs."
if sudo -v; then
    sudo apt-get -qy install \
        emacs
fi

echo "Linking .emacs configuration."
ln -s -f $(pwd)/emacs.el ${HOME}/.emacs
