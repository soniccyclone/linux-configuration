#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
    sudo install kustomize /usr/local/bin/
    rm kustomize
fi
