#! /usr/bin/bash

set -eou pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
	sudo add-apt-repository -y ppa:neovim-ppa/unstable
	sudo apt-get -qy update
	sudo apt-get -qy install \
		neovim
fi

nvim -V1 -v

mkdir -p ${HOME}/.config
ln -s -f -T $(pwd)/config ${HOME}/.config/nvim

