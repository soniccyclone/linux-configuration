#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    sudo apt-get -y install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra
fi
