# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Source ARM definitions
[ -e $HOME/.bashrc.arm ] && source $HOME/.bashrc.arm

[ -z "$PS1" ] && return

#------------------------------------------------------------
# SETTINGS
#------------------------------------------------------------

export TERM=xterm-256color
export MAKEFLAGS='-j3'

export GIT_PS1_SHOWDIRTYSTATE=YES
export GIT_PS1_SHOWSTASHSTATE=YES

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
export HISTIGNORE="&:ls:[bf]g:exit"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# When changing directory small typos can be ignored by Bash
shopt -s cdspell

# Need ctrl-d twice before exiting
set -o ignoreeof # ctrl-D will not exit the shell anymore
export IGNOREEOF=1

# default file creation permissuin
# user = all; group = r/w; others = none
umask 0027

# editor for svn, ...
export EDITOR=vim

# for developing: http://udrepper.livejournal.com/11429.html
#export MALLOC_CHECK_=3
#export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

# Let me have core dumps
ulimit -c unlimited

#------------------------------------------------------------
# COMPLETION
#------------------------------------------------------------

export BASH_COMPLETION=$HOME/etc/bash_completion
export BASH_COMPLETION_DIR=$HOME/.bash_completion.d
source $BASH_COMPLETION

#------------------------------------------------------------
# PATH
#------------------------------------------------------------

[ -d $HOME/bin ]        && export PATH=$HOME/bin:$PATH
[ -d $HOME/share/man ]  && export MANPATH=:$MANPATH:$HOME/share/man
[ -d $HOME/python ]     && export PYTHONPATH=$HOME/python:$PYTHONPATH
[ -f $HOME/.pystartup ] && export PYTHONSTARTUP=$HOME/.pystartup

#------------------------------------------------------------
# PROMPT
#------------------------------------------------------------

function hbar()
{
    eval printf '%.0s$2' {1..$1}
}

function prompt_command()
{
    local sv=$?

    local GRAY='\033[1;30m'
    local LIGHT_GRAY='\033[0;37m'
    local CYAN='\033[0;36m'
    local LIGHT_CYAN='\033[1;36m'
    local RED='\033[1;31m'
    local NO_COLOUR='\033[0m'

    [[ $1 = yes ]] && echo -en $GRAY
    local cols=`tput cols`
    cols=${cols:-50}
    # hbar $[ $cols - 5 ] "─" # unicode version
    hbar $[ $cols - 5 ] "_"

    [[ $1 = yes ]] && [ "a$sv" != "a0" ] && echo -en $RED

    printf "% 3d" $sv

    #echo -en $NO_COLOUR
    #echo -en $CYAN
}

# Define some colors first:
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
magenta='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'
nc='\e[0m'

function small_pwd {
    local pwdmaxlen=30
    local trunc_symbol="..."
    if [ ${#PWD} -gt $pwdmaxlen ]
    then
        local pwdoffset=$(( ${#PWD} - $pwdmaxlen ))
        newPWD="${trunc_symbol}${PWD:$pwdoffset:$pwdmaxlen}"
    else
        newPWD=${PWD}
    fi
    echo $newPWD
}

if [ $location == $sophia ]; then
    CLUSTER="30;47m"
elif [ $location == $cambridge ]; then
    CLUSTER="30;42m"
else
    CLUSTER="30;44m"
fi

PS1='\[\e[${CLUSTER}\]\h\[\e[0;0m\]:\[\e[01;32m\]\t\[\e[0m\]:\[\e[34m\]$(small_pwd)\[\e[0m\]> '
# PS1='$(prompt_command yes)\n'$PS1

#------------------------------------------------------------
# CCACHE
#------------------------------------------------------------

if hash ccache 2>&- ; then
    export CCACHE_DIR=/tmp/.ccache
    alias g++="ccache g++"
    alias gcc="ccache gcc"
    alias cc="ccache cc"
    alias c++="ccache c++"
fi

#------------------------------------------------------------
# ALIAS
#------------------------------------------------------------

alias gdb='gdb -tui' #enable the text window interface if possible
alias ls="BLOCK_SIZE=\'1 ls --color=auto -h" #enable thousands grouping and colour
alias ll='ls -l'
alias lla='ls -l -A'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias lsload='lsload -R 'order[]' | fgrep -v login | fgrep -v unavail | sort -n -k 6'
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias cpplint='cpplint.py --filter=-whitespace/braces,-whitespace/newline'
alias mozilla='firefox'

