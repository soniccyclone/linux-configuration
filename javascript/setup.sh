#! /bin/bash

set -euo pipefail

echo "Installing nodejs"
brew install node

echo "Installing language servers"
npm i -g typescript \
    vscode-langservers-extracted \
    yaml-language-server \
    dockerfile-language-server-nodejs

