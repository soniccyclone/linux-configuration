#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

# Add Docker's official GPG key:
if sudo -v; then
    sudo apt-get -qy update
    sudo apt-get -qy install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get -qy update

    # Install docker engine
    sudo apt-get -qy install \
	 docker-ce \
	 docker-ce-cli \
	 containerd.io \
	 docker-buildx-plugin \
	 docker-compose-plugin

    # Create docker group and add user to it
    if [ ! $(getent group docker) ]; then
	sudo groupadd docker
    fi
    sudo usermod -aG docker $USER
    # You will need to log out and back in to use docker without sudo.
    # You may also need to restart the docker service or your whole machine
    # as well.
fi
