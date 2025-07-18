# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

umask 007

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
  autoload zmv

  autoload -U is-at-least

  zgen oh-my-zsh

  zgen load zsh-users/zsh-completions

  if is-at-least 4.3.17; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
  fi

  if is-at-least 4.3.11; then
    zgen load supercrabtree/k
  fi

  zgen oh-my-zsh plugins/themes
  zgen oh-my-zsh plugins/history-substring-search
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/common-aliases

  zgen load chrissicool/zsh-256color

  # zgen load romkatv/powerlevel10k powerlevel10k

  zgen save
fi

unalias rm

# Oh-my-zsh configuration.
UPDATE_ZSH_DAYS=5

safe_source() {
  [[ -f "$1" ]] && source "$1"
}

safe_source $HOME/.cargo/env
safe_source $HOME/.rye/env
safe_source ${HOME}/.zshrc.private
safe_source ${HOME}/.zshrc.local
safe_source ${HOME}/.aliases

# Use ccache if available.
if command -v ccache &> /dev/null; then
  export OBJCACHE="ccache"
  export CC="ccache gcc"
  export CXX="ccache g++"
fi

# Neovim distribution selector
vv() {
  select config in lazyvim kickstart nvchad astrovim lunarvim
  do NVIM_APPNAME=nvim-$config nvim $@; break; done
}

eval "$(starship init zsh)"
