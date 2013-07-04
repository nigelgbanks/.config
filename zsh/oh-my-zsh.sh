#!/bin/zsh
ZSH=$CONFIG/zsh/oh-my-zsh
ZSH_CUSTOM=$CONFIG/zsh
ZSH_THEME="nbanks"
plugins=(git ssh-agent github rvm)
zstyle :omz:plugins:ssh-agent agent-forwarding on
case "$OS" in

"Darwin")
    source $HOME/.rvm/scripts/rvm
    ;;
"Debian")
    plugins+=debian
    ;;
"Red Hat")
    ;;
esac
# Now load Oh My ZSH
source $ZSH/oh-my-zsh.sh
