#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    sudo apt-get -y install compiz compiz-plugins-experimental emerald emerald-themes
fi
