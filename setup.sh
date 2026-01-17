#! /bin/bash

set -euo pipefail

if sudo -v; then
    sudo dnf -qy update
fi

cd $(dirname ${BASH_SOURCE[0]})
for service in *; do
	if [ -d "${service}" ]; then
		echo "Setting up ${service}."
		./${service}/setup.sh
	fi
done

