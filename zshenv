#!/bin/zsh

ulimit -c unlimited
umask 007

export EDITOR=vim
export VISUAL=$EDITOR
# export FPATH

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
