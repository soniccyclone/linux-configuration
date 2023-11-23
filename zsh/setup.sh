#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

# Install zsh
if sudo -v; then
	sudo dpkg-reconfigure -f noninteractive tzdata
	sudo apt-get -qy install \
		curl \
		zsh
fi

zsh --version
mkdir -p ~/.local/bin

# Install zprezto
ZPREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
if [ -d ${ZPREZTO_DIR} ]; then
  CWD=$(pwd)
  cd ${ZPREZTO_DIR}
  git pull
  git submodule sync --recursive
  git submodule update --init --recursive

  cd ${CWD}
else
  git clone -b master \
      --single-branch \
      --depth=1 \
      --recurse-submodules \
      --shallow-submodules \
      https://github.com/sorin-ionescu/prezto.git ${ZPREZTO_DIR}
fi

# Zsh script from zprezto install instructions
zsh -s <<- EOF
setopt EXTENDED_GLOB
for rcfile in \${ZPREZTO_DIR}/runcoms/^README.md(.N); do
  ln -s -f "\$rcfile" "\${ZDOTDIR:-\$HOME}/.\${rcfile:t}"
done
EOF

# Overwrite zprezto rc files with my own
for rcfile in "zshrc" "zpreztorc"; do
    rcfile_path="${ZDOTDIR:-$HOME}/.${rcfile}"
    rm -f ${rcfile_path}
    ln -s -f "$(pwd)/${rcfile}" ${rcfile_path}
done

# Install starship
export BIN_DIR="${HOME}/.local/bin"
curl -fsSL https://starship.rs/install.sh | sh -s -- --yes

mkdir -p ~/.config
rm -f ~/.config/starship.toml
ln -s -f "$(pwd)/starship.toml" ~/.config/starship.toml

