#! /usr/bin/bash

set -eou pipefail

cd $(dirname ${BASH_SOURCE[0]})

# Install Visual Studio Code
if sudo -v; then
    sudo apt-get -qy install \
        software-properties-common \
        apt-transport-https \
        wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt-get -qy update
	sudo apt-get -qy install \
		code
fi

code -v

# Install extensions
EXTENSIONS=(
    "vscjava.vscode-java-pack"
    "ms-dotnettools.csdevkit"
    "ionide.ionide-fsharp"
    "sinedied.vscode-windows-xp-theme"
)

for extension in ${EXTENSIONS[@]}; do
    code --install-extension ${extension}
done

# Setup user configuration
mkdir -p ${HOME}/.config/Code/User
ln -s -f $(pwd)/settings.json ${HOME}/.config/Code/User/settings.json
ln -s -f $(pwd)/keybindings.json ${HOME}/.config/Code/User/keybindings.json
