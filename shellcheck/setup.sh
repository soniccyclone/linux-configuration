#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing shellcheck."
BREW_KIND=""
BREW_PKG="shellcheck"

if ! brew list --versions $BREW_KIND "$BREW_PKG"; then
    brew install $BREW_KIND "$BREW_PKG"
elif [ -n "$(brew outdated $BREW_KIND "$BREW_PKG")" ]; then
    brew upgrade $BREW_KIND "$BREW_PKG"
fi
