#! /usr/bin/bash

set -eoux pipefail

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
	sudo apt-get -qy install\
		bat
fi

mkdir -p ${HOME}/.config/bat/
rm -f ${HOME}/.config/bat/config
ln -s -f $(pwd)/config ${HOME}/.config/bat

