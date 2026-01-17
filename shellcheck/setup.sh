#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing shellcheck."
if sudo -v; then
	sudo dnf -qy install \
		shellcheck
fi
