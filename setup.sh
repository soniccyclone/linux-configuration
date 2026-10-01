#! /bin/bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
CWD=$(pwd)

if ! command -v brew >/dev/null; then
    echo "Installing homebrew."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# this line also updates everything if this is running against
# a pre-existing install
brew update
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ASK=1

echo "Installing brew bundle."
brew bundle install --file="${CWD}/Brewfile"

echo "Installing global node packages."
npm i -g typescript \
    vscode-langservers-extracted \
    yaml-language-server \
    dockerfile-language-server-nodejs \
    @usebruno/cli \
    httpyac

echo "Linking dotfiles."
ln -s -f "${CWD}/emacs.el"   "${HOME}/.emacs"
ln -s -f "${CWD}/.gitconfig" "${HOME}/.gitconfig"

echo "Setup complete!"
