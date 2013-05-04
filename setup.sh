#!/bin/bash
source ./env.sh

# Run platform specific Setup
#===============================================================================
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

# Set up home directory
#===============================================================================
if [ ! -d "$DOWNLOADS" ]; then
    mkdir $DOWNLOADS
fi

if [ ! -d "$TMP" ]; then
    mkdir $TMP
fi

if [ ! -d "$PROJECTS" ]; then
    mkdir $PROJECTS
fi

# Set up links to appropriate files in .config
#===============================================================================
rm $HOME/.git-completion.bash
ln -s $CONFIG/bash/git-completion.bash $HOME/.git-completion.bash

rm $HOME/.emacs $HOME/.emacs.d
ln -s $CONFIG/emacs $HOME/.emacs.d

rm $HOME/.zshrc
ln -s $CONFIG/zsh/zshrc.sh $HOME/.zshrc

# Copy sensitive files from host system.
#===============================================================================
if [[ -n "$SSH_CLIENT" ]]; then
    scp ${SSH_CLIENT%% *}:~/.gitconfig $HOME
fi
