#! /usr/bin/bash

set -eoux pipefail

cd $(dirname ${BASH_SOURCE[0]})
CWD="$(pwd)"

curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
chmod +x "${CWD}/linux-install.sh"

if sudo -v; then
    sudo "${CWD}/linux-install.sh"
fi

rm -f "${CWD}/linux-install.sh"
