#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

# If this doesn't work, reference these:
# https://github.com/N0rbert/debian-mate-ayatana-settings/
# https://launchpad.net/~nrbrtx/+archive/ubuntu/dmas
# NOTE: for some reason this script added more than just jammy main to the dmas debian entry in /etc/apt/sources.list so I just went in and manually deleted it. Maybe this script is not idempotent? Be careful!

if sudo -v; then
    sudo apt-get --reinstall -o Dpkg::Options::=--force-confask -o Dpkg::Options::=--force-confnew install lightdm
    sudo apt-get -y update
    sudo apt-get -y install software-properties-common python3-launchpadlib
    sudo add-apt-repository -y main contrib non-free non-free-firmware
    sudo add-apt-repository -y "deb http://ppa.launchpad.net/nrbrtx/dmas/ubuntu jammy main"
    sudo apt-get -y install debian-mate-ayatana-settings
fi
