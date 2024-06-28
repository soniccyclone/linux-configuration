#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    curl -LO https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_linux_amd64.deb
    sudo dpkg -i k9s_linux_amd64.deb
    rm k9s_linux_amd64.deb
fi
