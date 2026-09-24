#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing tree."
BREW_KIND=""
BREW_PKG="tree"

if ! brew list --versions $BREW_KIND "$BREW_PKG"; then
    brew install $BREW_KIND "$BREW_PKG"
elif [ -n "$(brew outdated $BREW_KIND "$BREW_PKG")" ]; then
    brew upgrade $BREW_KIND "$BREW_PKG"
fi
