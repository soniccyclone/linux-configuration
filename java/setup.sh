#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    sudo dnf -qy install \
	 java-25-openjdk
fi
