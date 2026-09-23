#! /bin/bash

set -euo pipefail

# Every installer below depends on brew, so bootstrap it first.
if ! command -v brew >/dev/null; then
    echo "Installing Homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # A fresh install isn't on PATH yet; Apple Silicon vs Intel prefix.
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi

brew update
# Updated once above; don't re-run it on every brew install in the children.
export HOMEBREW_NO_AUTO_UPDATE=1

cd $(dirname ${BASH_SOURCE[0]})
for service in *; do
	if [ -d "${service}" ]; then
		echo "Setting up ${service}."
		./${service}/setup.sh
	fi
done
