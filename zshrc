#!/bin/zsh

umask 007

# make setopt safe (only set supported option by current shell version)
alias setopt=setopt_

setopt_() {
  local opts
  zmodload zsh/parameter
  for opt in "$@"; do
    (( $+options[$opt] )) && builtin setopt $opt
  done
}

# Enable debug messages
# setopt XTRACE VERBOSE

# eval $(dircolors -b)

#-------------------------------------------------------------------------------
# Zgen plugin manager
#-------------------------------------------------------------------------------
if [[ ! -d $HOME/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen
fi

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
[ -f $HOME/.zshrc.local ] && ZGEN_RESET_ON_CHANGE+=(${HOME}/.zshrc.local)

source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
    autoload -U is-at-least

    zgen oh-my-zsh

    # zgen load unixorn/autoupdate-zgen
    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-completions

    if is-at-least 4.3.17; then
      zgen load zsh-users/zsh-syntax-highlighting
      zgen load zsh-users/zsh-autosuggestions
    fi

    if is-at-least 4.3.11; then
      zgen load supercrabtree/k
    fi

    # zgen oh-my-zsh plugins/screen
    # zgen oh-my-zsh plugins/themes
    # zgen load zsh-users/zsh-history-substring-search
    # zgen oh-my-zsh plugins/history-substring-search
    # zgen load nojhan/liquidprompt
    # zgen load sindresorhus/pure
    # zgen load dfurnes/purer
    # zgen load therealklanni/purity
    zgen load mafredri/zsh-async
    zgen load jsleroy/purest

    zgen save
fi

PUREST_PATH_EXPANSION=%d

# #-------------------------------------------------------------------------------
# # Oh-my-zsh
# #-------------------------------------------------------------------------------
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"

[ -f $HOME/.zshrc.local ] && source ${HOME}/.zshrc.local

unalias setopt
