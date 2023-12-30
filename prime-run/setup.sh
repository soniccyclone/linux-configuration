#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Setting up nvidia prime-run"

mkdir -p ${HOME}/bin

ln -s -f $(pwd)/prime-run.sh ${HOME}/bin/prime-run

