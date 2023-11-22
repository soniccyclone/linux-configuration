#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})
for service in *; do
	if [ -d "${service}" ]; then
		echo "Setting up ${service}."
		./${service}/setup.sh
	fi
done

