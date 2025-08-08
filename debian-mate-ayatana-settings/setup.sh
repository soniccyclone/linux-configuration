#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

# If this doesn't work, reference these:
# https://github.com/N0rbert/debian-mate-ayatana-settings/
# https://launchpad.net/~nrbrtx/+archive/ubuntu/dmas
# NOTE: for some reason this script added more than just jammy main to the dmas debian entry in /etc/apt/sources.list so I just went in and manually deleted it. Maybe this script is not idempotent? Be careful!

if sudo -v; then
    sudo apt-get update
    sudo apt-get install software-properties-common python3-launchpadlib
    sudo add-apt-repository -y main contrib non-free non-free-firmware
    sudo add-apt-repository -y "deb http://ppa.launchpad.net/nrbrtx/dmas/ubuntu jammy main"
    sudo apt-get install debian-mate-ayatana-settings
fi
