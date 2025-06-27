#! /bin/bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "Installing mit-scheme."
if sudo -v; then
    sudo apt-get -qy install \
	 mit-scheme \
	 mit-scheme-dbg \
	 mit-scheme-doc
fi
