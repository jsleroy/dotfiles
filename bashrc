# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Source ARM definitions
[ -e $HOME/.bashrc.arm ] && source $HOME/.bashrc.arm

export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

#------------------------------------------------------------
# PROMPT
#------------------------------------------------------------
# plugin=~/.liquidprompt
# 
# if [ ! -d $plugin ] || test $(ls -A $plugin > /dev/null); then
#   mkdir -p $plugin
#   git clone https://github.com/nojhan/liquidprompt.git $plugin
# fi
# 
# source $plugin/liquidprompt

#------------------------------------------------------------
# SETTINGS
#------------------------------------------------------------

# export MAKEFLAGS='-j8'

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# When changing directory small typos can be ignored by Bash
shopt -s cdspell

export EDITOR=vim

# for developing: http://udrepper.livejournal.com/11429.html
#export MALLOC_CHECK_=3
#export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

# Let me have core dumps
ulimit -c unlimited

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#------------------------------------------------------------
# PROMPT
#------------------------------------------------------------

# eval `dircolors -b`
# source ~/dotfiles/promptline.sh
# export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]:+${FUNCNAME[0]}():} '

#------------------------------------------------------------
# ALIAS
#------------------------------------------------------------

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree --dirsfirst -C'
alias mozilla='firefox'

umask 027
