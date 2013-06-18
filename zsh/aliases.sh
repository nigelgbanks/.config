# Navigation/Shortcuts
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dt="downto"
alias ut="upto"
alias ll="ls -l"
alias lla="ls -la"
alias xa="xargs"
alias t="tail -f"
# Copy/Paste
if [[ -n "$SSH_CLIENT" ]]; then
    alias pbcopy="ssh ${SSH_CLIENT%% *} pbcopy"
    alias pbpaste="ssh ${SSH_CLIENT%% *} pbpaste"
fi
alias copy="pbcopy"
alias paste="pbpaste"
# Git
alias g="git"
alias st="g st"
# PHP
alias drush="$HOME/.drush/drush"
alias phpl='find . \( -name "*.inc" -o -name "*.php" -o -name "*.module" -o -name "*.install" -o -name "*.test" \) -exec php -l {} \;'
alias cs='phpcs --standard=/usr/share/php/PHP/CodeSniffer/Standards/Drupal/ruleset.xml --extensions=php,module,inc,install,test,profile,theme'
alias csdir='find . \( -name "*.inc" -o -name "*.php" -o -name "*.module" -o -name "*.install" -o -name "*.test" \) -exec cs {} \;'
alias codereview="drush coder-review --reviews=production,security,style,i18n,potx,sniffer "
# Programs
alias irc="irssi"
alias screen="screen -e^^^"
# System dependent
case "$OS" in

"Darwin")
    ;;
"Debian")
    alias time_sync="sudo ntpdate ntp.ubuntu.com"
    alias jslint="node /opt/jslint/node_modules/jslint/bin/jslint.js"
    ;;
"Red Hat")
    ;;
esac
# Machine Dependent
case "$HOST" in

"hal.local")
    alias rebuild="cd /Users/nbanks/Projects/fcrepo4 && mvn install -DskipTests && cd fcrepo-webapp && MAVEN_OPTS="-Xmx512m" mvnDebug jetty:run"
    ;;
esac
alias modules-status='for d in */.git/..; do cd $d && d=${PWD##*/} && x="$fg_bold[blue]$(git_prompt_info)" && echo "$d ${(%)x}" && cd ..; done'
alias modified-modules-status='modules-status | grep ✗'
alias modules-update='for d in */.git/..; do cd $d && d=${PWD##*/} && x="$fg_bold[blue]$(git_prompt_info)" && echo "$d ${(%)x}" && git update && cd .. && done'
alias modules-update-bg='for d in */.git/..; do cd $d && d=${PWD##*/} &&  b=`g current` && echo "$d ($b)" && git update && cd .. && done &>/dev/null &'
