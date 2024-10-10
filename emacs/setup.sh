#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})
CWD=$(pwd)

echo "Compiling emacs."
EMACS_VERSION=29.1

if sudo -v; then
	sudo dnf group install "Development Tools"
	sudo dnf builddep emacs
fi

if ! [ -f ./emacs-${EMACS_VERSION}.tar.xz ]; then
    curl -LO http://ftp.gnu.org/gnu/emacs/emacs-${EMACS_VERSION}.tar.xz
fi
tar -xvf emacs-${EMACS_VERSION}.tar.xz

export CC="gcc"
export CFLAGS='-O3 -march=native -pipe'

cd ./emacs-${EMACS_VERSION}
./autogen.sh
./configure \
    --without-compress-install \
    --with-json \
    --with-native-compilation=aot \
    --with-tree-sitter

make -j 14

echo "Installing emacs."
sudo make install

echo "Setting up emacs configuration."
ln -s -f ${CWD}/emacs.el ${HOME}/.emacs
