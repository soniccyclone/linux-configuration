#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})
CWD=$(pwd)

echo "Installing emacs."
brew install emacs

echo "Setting up emacs configuration."
ln -s -f ${CWD}/emacs.el ${HOME}/.emacs
