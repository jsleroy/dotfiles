#!/bin/zsh

# Force login shell when connecting via SSH
# Slightly incorrect (eg. screen inside SSH
# will act as a login shell, but that's better
# than getting no login shell at all
[ -n "$SSH_CONNECTION" ] && setopt -l

ulimit -c 0
umask 007

#export LANG=en_GB.UTF-8
#export LC_ALL=C

export LESS_TERMCAP_mb=$'\E[0m'         #blink
export LESS_TERMCAP_md=$'\E[01;31m'     #bold start
export LESS_TERMCAP_me=$'\E[0m'         #bold end
export LESS_TERMCAP_so=$'\E[01;07;30m'  #search matches (standout)
export LESS_TERMCAP_se=$'\E[0m'         #standout end
export LESS_TERMCAP_us=$'\E[04;32m'     #underline start
export LESS_TERMCAP_ue=$'\E[0m'         #underline end
export LESS='-iMR'

export MANPATH=$(MANPATH= manpath)
export MANWIDTH=80
export EDITOR=vim
export VISUAL=$EDITOR
export TERM=xterm-256color

export FULLNAME="Albin Tonnerre"
export EMAIL='albin.tonnerre@gmail.com'
export MAKEFLAGS="-j$(($(grep -c ^processor /proc/cpuinfo)+2))"
export MAIL=/var/mail/$USER

export FPATH

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/lib" ] && export LD_LIBRARY_PATH="$HOME/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH"
[ -d "$HOME/python" ] && export PYTHONPATH="$HOME/python:$PYTHONPATH"
[ -f ~/.pystartup ] && export PYTHONSTARTUP=~/.pystartup

da64 () { f=$(mktemp); echo 0x$(echo ${1#0x} | fold -w 2 | tac | paste -d '' -s -) |  xxd -r >| $f; aarch64-linux-gnu-objdump -b binary -m aarch64 -D $f }
da32 () { f=$(mktemp); echo 0x$(echo ${1#0x} | fold -w 2 | tac | paste -d '' -s -) |  xxd -r >| $f; arm-none-eabi-objdump -b binary -m arm -D $f }
