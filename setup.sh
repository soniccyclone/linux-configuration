#! /bin/bash

set -euo pipefail

if sudo -v; then
    sudo dnf -qy update
    sudo dnf -qy update
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
echo >> ${HOME}/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ${HOME}/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install Homebrew's dependencies
sudo yum -qy groupinstall 'Development Tools'

cd $(dirname ${BASH_SOURCE[0]})
for service in *; do
	if [ -d "${service}" ]; then
		echo "Setting up ${service}."
		./${service}/setup.sh
	fi
done

