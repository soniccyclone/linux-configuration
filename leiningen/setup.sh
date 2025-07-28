#! /usr/bin/bash

set -eoux pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
	sudo apt-get install -y \
		leiningen
fi

