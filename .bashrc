# .bashrc

export LC_ALL=
export LC_COLLATE="C"

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

sophia=0
cambridge=1
home=2

case $(domainname) in
    "nice.arm.com")      location=$sophia;;
    "cambridge.arm.com") location=$cambridge;;
    *)                   location=$home;;
esac

source /arm/tools/setup/init/bash-lite

#------------------------------------------------------------
# PK/MODULES
#------------------------------------------------------------

if [ $location == $cambridge ]; then

    module load swdev
    module load util
    module load eda
    module load arm/cluster/1.2
    module load git/git/1.7.1
    module load tigris/subversion/1.6.2
    module load python/python/2.6.5
    module load mentor/modelsim/6.5e

else

    source /arm/scratch/pktools/init/init.bash
    pk reload

fi

#------------------------------------------------------------
# Compilation
#------------------------------------------------------------

export MAKEFLAGS='-j3'

#------------------------------------------------------------
# VIM
#------------------------------------------------------------

if [ $location == $cambridge ]; then
    [ ! -e $HOME/bin/vim ] && module load util vim/vim/7.3
else
    [ ! -e $HOME/bin/vim ] && pk load vim-7.3
fi

[ -z "$PS1" ] && return

#------------------------------------------------------------
# PATH
#------------------------------------------------------------
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

[ -d $HOME/python ] && export PYTHONPATH=$HOME/python:$PYTHONPATH
[ -f $HOME/.pystartup ] && export PYTHONSTARTUP=$HOME/.pystartup

export PYTHONPATH=/projects/pr412_skylark/python-user-packages/lib/python2.6/site-packages:$PYTHONPATH
export PATH=/projects/pr412_skylark/python-user-packages/bin:$PATH

#------------------------------------------------------------
# COMPLETION
#------------------------------------------------------------

. /arm/tools/setup/init/bash.d/modules-autocompletion
export BASH_COMPLETION=$HOME/etc/bash_completion
export BASH_COMPLETION_DIR=$HOME/.bash_completion.d
source $BASH_COMPLETION

#------------------------------------------------------------
# PREF
#------------------------------------------------------------

# default file creation permissuin
# user = all; group = r/w; others = none
umask 0027

# vim and gnome-terminal have support for 256 colours
export TERM=xterm-256color

# editor for svn, ...
export EDITOR=vim

# for developing: http://udrepper.livejournal.com/11429.html
#export MALLOC_CHECK_=3
#export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

# Let me have core dumps
ulimit -c unlimited

unset XMODIFIERS
export VCS_LIC_EXPIRE_WARNING=0
export SHELL=/bin/bash
export NOVAS_MANAGE_RC_DIR=~/

#------------------------------------------------------------
# PROMPT
#------------------------------------------------------------

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
elif [ $location == $home ]; then
    CLUSTER="30;44m"
fi

PS1='\[\e[${CLUSTER}\]\h\[\e[0;0m\]:\[\e[01;32m\]\t\[\e[0m\]:\[\e[34m\]$(small_pwd)\[\e[0m\]> '

export GIT_PS1_SHOWDIRTYSTATE=YES
export GIT_PS1_SHOWSTASHSTATE=YES

#------------------------------------------------------------
# PROJECT
#------------------------------------------------------------

export LSB_DEFAULTPROJECT=PR412

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

#------------------------------------------------------------
# BOOST library
#------------------------------------------------------------

export BOOST_ROOT=/work/jealer01/tools/boost_trunk

#------------------------------------------------------------
# CCACHE
#------------------------------------------------------------

export CCACHE_DIR=/work/jealer01/work/.ccache

#alias g++="ccache g++"
#alias gcc="ccache gcc"
#alias cc="ccache cc"
#alias c++="ccache c++"

#------------------------------------------------------------
# ALIAS
#------------------------------------------------------------

[ -f $HOME/.bash_alias ] && source $HOME/.bash_alias

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
#alias ssh='ssh -C4c arcfour,blowfish-cbc'
alias mozilla='firefox'

export MANPATH=:$MANPATH:$HOME/share/man

