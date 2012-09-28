source ~/.git-completion.bash

export PS1='\[\e[32;1m\]\w\[\e[0m\]$(__git_ps1 "(\[\e[1;33m\]%s\[\e[m\])")\[\e[32;1m\]>\[\e[0m\]'
#export PS1='\u@:\w$(__git_ps1 " (\[\e[1;33m\]%s\[\e[m\])")\$ '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ve='source ~/ve/bin/activate'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias rm="echo Use del, or full path name for rm"

PATH=/usr/local/bin:$PATH
