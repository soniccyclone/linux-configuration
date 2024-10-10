#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
	sudo dnf groupinstall -qy "Development Tools" "Development Libraries"
fi

