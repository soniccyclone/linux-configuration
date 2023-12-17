#! /bin/bash

set -eo pipefail

EMACS_VERSION=29.1
INSTALL_DIR=${HOME}/.local

cd $(dirname ${BASH_SOURCE[0]})

if sudo -v; then
    sudo apt-get update -qy
    sudo apt-get -qy install \
        build-essential \
        autoconf \
        gcc-11 \
        libgccjit0 \
        libgccjit-11-dev \
        libgtk-3-dev \
        libwebkit2gtk-4.0-dev \
        libjansson4 \
        libjansson-dev \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        libxpm-dev \
        libgif-dev \
        libtree-sitter-dev \
        libgnutls28-dev \
        make \
        wget \
        pkg-config \
        libncurses-dev
fi

if ! [ -f ./emacs-${EMACS_VERSION}.tar.xz ]; then
    curl -LO http://ftp.gnu.org/gnu/emacs/emacs-${EMACS_VERSION}.tar.xz
fi
tar -xvf emacs-${EMACS_VERSION}.tar.xz

export CC="gcc-11"
export CFLAGS='-O3 -march=native -pipe'

cd ./emacs-${EMACS_VERSION}
./autogen.sh
./configure \
    --prefix=${INSTALL_DIR} \
    --without-compress-install \
    --with-json \
    --with-native-compilation=aot \
    --with-tree-sitter

make -j 16
make install
