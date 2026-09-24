#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})
CWD=$(pwd)

echo "Installing emacs."
BREW_KIND="--cask"
BREW_PKG="emacs-app"

if ! brew list --versions $BREW_KIND "$BREW_PKG"; then
    brew install $BREW_KIND "$BREW_PKG"
elif [ -n "$(brew outdated $BREW_KIND "$BREW_PKG")" ]; then
    brew upgrade $BREW_KIND "$BREW_PKG"
fi

echo "Setting up emacs configuration."
ln -s -f ${CWD}/emacs.el ${HOME}/.emacs
