#!/bin/bash
source ./env.sh

case "$OS" in

"Darwin")  echo "Setup Mac enviroment"
    ./bash/setup_darwin.sh
    ;;
"Debian")  echo  "Setup Debian"
    ./bash/setup_debian.sh
    ;;
"Red Hat")  echo  "Setup RedHat"
    ./bash/setup_redhat.sh
    ;;
esac

# Install oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
   curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
