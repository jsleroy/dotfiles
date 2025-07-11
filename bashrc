safe_source() {
  [[ -f "$1" ]] && source "$1"
}

safe_source /etc/bashrc
safe_source $HOME/.bashrc.codasip
safe_source $HOME/.aliases

export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

#------------------------------------------------------------
# PROMPT
#------------------------------------------------------------
source $HOME/.liquidprompt/liquidprompt

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

umask 007

# Use ccache if available.
if command -v ccache &> /dev/null; then
  export OBJCACHE="ccache"
  export CC="ccache gcc"
  export CXX="ccache g++"
fi

# [ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"
# [ -d "$HOME/.platformio" ] && source "$HOME/.platformio/penv/bin"

safe_source $HOME/.cargo/env
safe_source $HOME/.rye/env

eval "$(starship init bash)"
