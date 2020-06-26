case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;0m\] \[\033[48;5;10m\]\[$(tput bold)\] \t \[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;8m\]\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[48;5;-1m\] \w (\[$(tput bold)\]\[\033[38;5;10m\]\$(git branch 2>/dev/null |grep '^*'|colrm 1 2)\[$(tput sgr0)\]) \[$(tput sgr0)\] \n ↳ \$ "


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####################################################################################
### The --clear option make sure Intruder cannot use your existing SSH-Agents keys
### i.e. Only allow cron jobs to use password less login
#####################################################################################
/usr/bin/keychain $HOME/.ssh/id_rsa  > /dev/null 2>&1
source $HOME/.keychain/$HOSTNAME-sh  > /dev/null 2>&1
