#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing kind."
if sudo -v; then
	sudo dnf -qy install \
		kind
fi

