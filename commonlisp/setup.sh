#! /bin/bash

set -eo pipefail

cd $(dirname ${BASH_SOURCE[0]})

echo "Setting up Common Lisp"

# Install SBCL
if sudo -v; then
    sudo apt-get -qy install \
	 sbcl
fi

# Install quicklisp
curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
       --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
       --eval '(ql:add-to-init-file)' \
       --quit

# Install SLIME
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit
