#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
	sudo apt-get -qy install \
		openjdk-21-jdk
fi
