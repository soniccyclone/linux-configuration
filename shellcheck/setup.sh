#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing shellcheck."
if sudo -v; then
	sudo apt-get -qy install \
		shellcheck
fi
