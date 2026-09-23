#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing git."
brew install git

echo "Linking .gitconfig."

ln -s -f $(pwd)/.gitconfig ~/.gitconfig
