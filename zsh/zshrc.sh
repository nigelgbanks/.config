#!/bin/zsh
source $HOME/.config/env.sh
source $CONFIG/zsh/oh-my-zsh.sh
source $CONFIG/zsh/aliases.sh
source $CONFIG/zsh/functions.sh
# Include scripts in path and autocomplete for them.
fpath=($CONFIG/zsh/completion $fpath) # Autocomplete for custom scripts
# compsys initialization
autoload -U compinit
compinit
# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
