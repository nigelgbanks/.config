#!/bin/zsh

source $HOME/.config/env.sh
source $CONFIG/zsh/oh-my-zsh.sh
source $CONFIG/zsh/aliases.sh
source $CONFIG/zsh/functions.sh

# Include scripts in path and autocomplete for them.
fpath=($CONFIG/zsh/completion $fpath) # Autocomplete for custom scripts
# Initialize compsys
autoload -U compinit
compinit
# Show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

# Run platform specific Setup
#===============================================================================
case $OS in

"Darwin")
    ./bash/growlnotify.sh
    ;;
"Debian")
    ;;
"Red Hat")
    ;;
esac
