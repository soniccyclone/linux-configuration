#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing git."
if sudo -v; then
	sudo apt-get -qy install \
		git
fi

echo "Linking .gitconfig."

ln -s -f $(pwd)/.gitconfig ~/.gitconfig
