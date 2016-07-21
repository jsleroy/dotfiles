#!/bin/zsh

autoload -U is-at-least

eval $(dircolors -b)

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
      zgen oh-my-zsh plugin/colored-man-pages
      # zgen oh-my-zsh plugins/sudo
      # zgen oh-my-zsh plugins/command-not-found

      zgen load zsh-users/zsh-completions src
      zgen load zsh-users/zsh-syntax-highlighting
      zgen load zsh-users/zsh-history-substring-search

      # zgen load tarruda/zsh-autosuggestions
      # zgen load chrissicool/zsh-256color

      zgen load nojhan/liquidprompt

      zgen save
  fi

  # # Enable autosuggestions automatically.
  # zle-line-init() {
  #     zle autosuggest-start
  # }
  # zle -N zle-line-init
fi

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

#-------------------------------------------------------------------------------
# Oh-my-zsh
#-------------------------------------------------------------------------------
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

#-------------------------------------------------------------------------------
# Misc
#-------------------------------------------------------------------------------
PROMPT_EOL_MARK=""

# zmv - a command for renaming files by means of shell patterns
# http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv
alias zmv='noglob zmv -W'

# zargs -  an alternative to find -exec and xargs
# http://zshwiki.org/home/builtin/functions/zargs
# autoload -U zargs

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# cd will never select the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# provide .. as a completion
zstyle ':completion:*' special-dirs ..

# ctrl-x-e to open current line in $EDITOR, awesome when writting functions
# or editing multiline commands.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# nobody need flow control anymore
setopt noflowcontrol

# we don't want to quote/espace URLs on our own...
if autoload -U url-quote-magic; then
  zle -N self-insert url-quote-magic
  zstyle ':url-quote-magic:*' url-metas '*?[]^()~#{}='
fi

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# don't share history
unsetopt share_history

# don't exist interactive sessions
set ignoreeof on

#-------------------------------------------------------------------------------
# Configuration settings for zsh < 5.0
# TODO: move in a separate zshrc ?
#-------------------------------------------------------------------------------
if ! is-at-least 5.0; then
  # ignore lines prefixed with '#'.
  setopt interactivecomments

  # completion
  autoload -U compinit && compinit

  zstyle ':completion:*' rehash true
  zstyle ':completion:*' use-cache on
  zstyle ':completion:*' cache-path ~/.zsh_cache
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*' list-dirs-first on
  zstyle ':completion:*:matches' group on
  zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
  zstyle ':completion:*' use-compctl false
  zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
  zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
  # zstyle ':completion:*' menu select
  zstyle ':completion:*' completer _complete _match _approximate
  zstyle ':completion:*:match:*' original only
  zstyle ':completion:*:approximate:*' max-errors 1 numeric
  zstyle ':completion:*:functions' ignored-patterns '_*'
  zstyle ':completion:*:*:kill:*' menu yes select
  zstyle ':completion:*:kill:*' force-list always
  zstyle ':completion:*' squeeze-slashes true

  zstyle -e ':completion::*:*:*:hosts' hosts \
    'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

  # not just at the end
  setopt complete_in_word

  setopt always_to_end

  # show completion menu on successive tab press
  setopt auto_menu

  # append history list to the history file
  setopt append_history

  # save each command's beginning timestamp and the duration to the history file
  setopt extended_history

  # don't save duplicates
  setopt hist_ignore_all_dups
  setopt hist_ignore_dups

  setopt completealiases
  setopt hist_reduce_blanks
  setopt hist_save_no_dups
  setopt hist_verify

  # use zsh style word splitting
  setopt noshwordsplit

  # avoid "beep"ing
  setopt nobeep

  # in order to use #, ~ and ^ for filename generation grep word
  # *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
  # don't forget to quote '^', '~' and '#'!
  setopt extended_glob

  # perform cd command automatically
  setopt auto_cd

  # report the status of backgrounds jobs immediately
  setopt notify

  # display PID when suspending processes as well
  setopt longlistjobs

  # whenever a command completion is attempted, make sure the entire command
  # path is hashed first
  setopt hash_list_all

  # don't send SIGHUP to background processes when the shell exits
  setopt nohup

  # not just at the end
  setopt completeinword
fi

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

autoload -Uz colors && colors

# turn on command substitution in the prompt (and parameter expansion and
# arithmetic expansion)
setopt prompt_subst

#-------------------------------------------------------------------------------
# Keys
#-------------------------------------------------------------------------------
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
