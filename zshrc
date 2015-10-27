#!/bin/zsh

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

autoload -U is-at-least

#-------------------------------------------------------------------------------
# Zgen plugin manager
#-------------------------------------------------------------------------------
if is-at-least 5.0; then
  if [[ ! -d $HOME/.zgen ]]; then
    git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen
  fi

  ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
  [ -f $HOME/.zshrc.local ] && ZGEN_RESET_ON_CHANGE+=(${HOME}/.zshrc.local)

  source $HOME/.zgen/zgen.zsh

  if ! zgen saved; then
      zgen oh-my-zsh

      zgen oh-my-zsh plugins/git
      zgen oh-my-zsh plugins/sudo
      zgen oh-my-zsh plugin/colored-man-pages
      # zgen oh-my-zsh plugins/command-not-found

      zgen load zsh-users/zsh-syntax-highlighting
      zgen load zsh-users/zsh-completions src
      zgen load zsh-users/zsh-history-substring-search

      zgen load chrissicool/zsh-256color

      zgen save
  fi
fi

#-------------------------------------------------------------------------------
# Alias
#-------------------------------------------------------------------------------

alias ls='ls --color=auto --human-readable --classify'

#-------------------------------------------------------------------------------
# Misc
#-------------------------------------------------------------------------------

eval `dircolors -b`

zstyle ':completion:*' rehash true

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

autoload -Uz colors && colors

setopt prompt_subst

if is-at-least 4.3.0; then
  autoload -Uz vcs_info

  zstyle ':vcs_info:*' enable git svn hg
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' check-for-staged-changes true
  zstyle ':vcs_info:*' get-revision true

  zstyle ':vcs_info:*' stagedstr   "%B%F{green}*%f%b"
  zstyle ':vcs_info:*' unstagedstr "%B%F{red}*%f%b"

  vcs_info_format="(%s:%F{cyan}%b%f%u%c%m)"

  zstyle ':vcs_info:*' actionformats "${vcs_info_format}%F{red}%a%f"
  zstyle ':vcs_info:*' formats       "${vcs_info_format}"

  unset vcs_info_format

  zstyle ':vcs_info:git*+set-message:*' hooks git-st git-untracked

  # git: display untracked files
  +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
      git status --porcelain | grep '??' &> /dev/null ; then
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='?'
    fi
  }

  # git: compare local changes to remote changes
  +vi-git-st() {
    # local ahead behind
    # local -a gitstatus

    # for git < 1.7
    # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    # ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    # (( $ahead )) && gitstatus+=( "+${ahead}" )

    # for git < 1.7
    # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    # behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    # (( $behind )) && gitstatus+=( "-${behind}" )

    # hook_com[misc]+=${(j:/:)gitstatus}
  }

  precmd () {
    vcs_info

    header_prompt="%{%B%F{8}%}%t%f%b [%n@%U%m%u %B%F{white}%${pwd_len}~%f%b]"
    pwd_len=6
    git_prompt=""

    if [[ -n ${vcs_info_msg_0_} ]]; then
      pwd_len=3
      git_prompt=" ${vcs_info_msg_0_}"
    fi

    status_prompt=" %B%(?.%F{white}.%F{red})${PROMPT_SYMBOL:-❯}%f%b "

    PROMPT='${header_prompt}${git_prompt}${status_prompt}'
    PROMPT2='%B%F{blue}%_%f%b> '
    PROMPT3='%B%F{blue}(?)%f%b> '
    PROMPT4='%B%F{blue}%N%f:%i%b> '
    RPROMPT=''
  }

# Fallback for pretty old zsh versions
else
  autoload -U promptinit && promptinit
  prompt adam2
fi
