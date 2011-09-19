# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="philips"

# ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

eval `dircolors -b`

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

export EDITOR="vim"

export TERM=xterm-256color
export MAKEFLAGS='-j3'

export GIT_PS1_SHOWDIRTYSTATE=YES
export GIT_PS1_SHOWSTASHSTATE=YES

[[ -d $HOME/bin ]]        && export PATH=$HOME/bin:$PATH
[[ -d $HOME/share/man ]]  && export MANPATH=:$MANPATH:$HOME/share/man
[[ -d $HOME/python ]]     && export PYTHONPATH=$HOME/python:$PYTHONPATH
[[ -f $HOME/.pystartup ]] && export PYTHONSTARTUP=$HOME/.pystartup

alias gdb='gdb -tui' #enable the text window interface if possible
alias ls="BLOCK_SIZE=\'1 ls --color=auto -h" #enable thousands grouping and colour
alias ll='ls -l'
alias lla='ls -l -A'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias lsload='lsload -R "order[]" | fgrep -v login | fgrep -v unavail | sort -n -k 6'
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias cpplint='cpplint.py --filter=-whitespace/braces,-whitespace/newline'
alias mozilla='firefox'


