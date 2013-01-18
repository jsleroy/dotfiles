# .bashrc


# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

eval `dircolors ~/.dir_colors`

export TERM=xterm-256color

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Source ARM definitions
[ -e $HOME/.bashrc.arm ] && source $HOME/.bashrc.arm

export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

#------------------------------------------------------------
# SETTINGS
#------------------------------------------------------------

# export MAKEFLAGS='-j3'

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
# user = all; group = none; others = none
umask 027

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

[ -e $HOME/etc/bash_completion ] && [ -z "$BASH_COMPLETION" ] && export BASH_COMPLETION=$HOME/etc/bash_completion
[ -e $HOME/.bash_completion.d ] && [ -z "$BASH_COMPLETION_DIR" ] && export BASH_COMPLETION_DIR=$HOME/.bash_completion.d
[ ! -z $BASH_COMPLETION ] && source $BASH_COMPLETION

#------------------------------------------------------------
# PATH
#------------------------------------------------------------

[ -d $HOME/bin ]        && export PATH=$HOME/bin:$PATH
[ -d $HOME/share/man ]  && export MANPATH=:$MANPATH:$HOME/share/man
[ -d $HOME/python ]     && export PYTHONPATH=$HOME/python:$PYTHONPATH
[ -f $HOME/.pystartup ] && export PYTHONSTARTUP=$HOME/.pystartup

[ -d $HOME/dotfiles/gnome-terminal-colors-solarized/ ] && export PATH=$HOME/dotfiles/gnome-terminal-colors-solarized/:$PATH

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

[ -e $HOME/.aliases ] && source $HOME/.aliases

#------------------------------------------------------------
# PS1
#------------------------------------------------------------

source ~/dotfiles/liquidprompt/liquidprompt
