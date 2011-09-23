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

source $HOME/.zshrc.arm

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache

setopt hist_ignore_all_dups

eval `dircolors -b`

export HISTFILE=$HOME/.zsh_history
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

alias -g gdb='gdb -tui' #enable the text window interface if possible
alias -g ls="BLOCK_SIZE=\'1 ls --color=auto -h" #enable thousands grouping and colour
alias -g ll='ls -l'
alias -g lla='ls -l -A'
alias -g la='ls -A'
alias -g l='ls -CF'
alias -g vi='vim'
alias -g lsload='lsload -R "order[]" | fgrep -v login | fgrep -v unavail | sort -n -k 6'
alias -g grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
alias -g cpplint='cpplint.py --filter=-whitespace/braces,-whitespace/newline'
alias -g mozilla='firefox'


