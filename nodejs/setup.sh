#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing nodejs."
if sudo -v; then
	sudo dnf -qy install \
		nodejs22
fi

echo "Setting npm to install to ~/.local/"
npm config set prefix ~/.local

