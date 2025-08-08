#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    curl -LO https://palfrey.github.io/discord-apt/discord-repo_1.0_all.deb
    sudo dpkg -i discord-repo_1.0_all.deb
    sudo apt-get update
    sudo apt-get -y install discord
fi
rm discord-repo_1.0_all.deb
