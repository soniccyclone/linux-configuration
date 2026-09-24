#! /bin/bash

set -euo pipefail

echo "Installing nodejs"
BREW_KIND=""
BREW_PKG="node"

if ! brew list --versions $BREW_KIND "$BREW_PKG"; then
    brew install $BREW_KIND "$BREW_PKG"
elif [ -n "$(brew outdated $BREW_KIND "$BREW_PKG")" ]; then
    brew upgrade $BREW_KIND "$BREW_PKG"
fi

echo "Installing language servers"
npm i -g typescript \
    vscode-langservers-extracted \
    yaml-language-server \
    dockerfile-language-server-nodejs

