#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

# Add Docker's official GPG key:
if sudo -v; then
    sudo dnf -qy install dnf-plugins-core
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    # Install docker engine
     sudo dnf install -qy docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Create docker group and add user to it
    if [ ! $(getent group docker) ]; then
	sudo groupadd docker
    fi
    sudo usermod -aG docker $USER
    # You will need to log out and back in to use docker without sudo.
    # You may also need to restart the docker service or your whole machine
    # as well.
    sudo systemctl enable docker
fi
