#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing pandoc."
BREW_KIND=""
BREW_PKG="pandoc"

if ! brew list --versions $BREW_KIND "$BREW_PKG"; then
    brew install $BREW_KIND "$BREW_PKG"
elif [ -n "$(brew outdated $BREW_KIND "$BREW_PKG")" ]; then
    brew upgrade $BREW_KIND "$BREW_PKG"
fi

