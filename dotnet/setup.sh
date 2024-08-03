#! /bin/bash

set -euo pipefail

cd $(dirname ${BASH_SOURCE[0]})

# Update packages
sudo apt update

sudo apt-get -qy install \
	dotnet-sdk-8.0
