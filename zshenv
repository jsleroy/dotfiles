#!/bin/zsh

ulimit -c unlimited
umask 007

export EDITOR=vim
export VISUAL=$EDITOR
export TERM=xterm-256color
export MAKEFLAGS="-j$(($(grep -c processor /proc/cpuinfo) + 2))"
export FPATH

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -f ~/.pystartup ] && export PYTHONSTARTUP=~/.pystartup
