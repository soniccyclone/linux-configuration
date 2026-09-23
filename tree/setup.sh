#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Installing tree."
brew install tree
