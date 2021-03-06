##
## Preamble
##

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\](\[\033[01;34m\]\W\[\033[00m\])\$ '
else
    PS1='\u@\h(\W)\$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
esac

##
## Bash options
##

shopt -s cdspell checkwinsize extglob histreedit histappend cmdhist lithist
shopt -s no_empty_cmd_completion

##
## Envariables
##

# MacPorts Installer addition on 2010-02-02_at_16:16:55: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#export HISTCONTROL=ignoredups,ignorespace,ignoreboth
export HISTSIZE=100000

export LSCOLORS="ExfxcxdxbxEgedabagacad"
export TMPDIR=/tmp
export MANPATH=$MANPATH:/usr/local/git/man

export EDITOR="/usr/bin/emacs"
export CVS_EDITOR=$EDITOR SVN_EDITOR=$EDITOR GIT_EDITOR=$EDITOR


##
## Aliases
##

alias su='sudo -s'
alias df='df -klH '
alias rs='rsync -avuxe ssh '
alias grep='grep --line-buffered --color=always'
alias less='less -R'
alias lsof='lsof -nP'
alias diff='diff -u'
alias cleanup='find -name .#* -o -name *.~*~  | xargs rm'

[ -n "`which gfind`"  ] && alias find=gfind

case `uname` in
    Linux)
    alias ls='ls -F --color=auto '
    ;;
    Darwin)
    alias ls='ls -FG '
    ;;
esac

##
## Functions
##

#function field { awk "{ print \$$1 }"; }
function field { s=""; c=""; for a in $*; do s="$s$c\$$a"; c=","; done; awk "{ print $s }"; }
function fcount {
    field $1 | sort | uniq -c | sort -rn | head $2
}
alias f=field

