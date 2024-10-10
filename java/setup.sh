#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    sudo dnf -qy install \
	 java-21-openjdk-devel.x86_64
fi
