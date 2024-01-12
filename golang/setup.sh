#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing golang"

curl -OL https://golang.org/dl/go1.21.6.linux-amd64.tar.gz

sudo rm -rf /usr/local/go

sudo tar -C /usr/local -xvf go1.21.6.linux-amd64.tar.gz

