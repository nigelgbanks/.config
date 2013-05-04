#!/bin/zsh
ZSH=$CONFIG/zsh/oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git ssh-agent github rvm)
zstyle :omz:plugins:ssh-agent agent-forwarding on
case "$OS" in

"Darwin")
    ;;
"Debian")
    plugins+=debian
    ;;
"Red Hat")
    ;;
esac
# Now load Oh My ZSH
source $ZSH/oh-my-zsh.sh
