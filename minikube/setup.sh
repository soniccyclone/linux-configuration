#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
    sudo rpm -Uvh minikube-latest.x86_64.rpm
    rm minikube-latest.x86_64.rpm
fi
