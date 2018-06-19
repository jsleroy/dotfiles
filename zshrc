#!/bin/zsh

# Enable debug messages
# setopt XTRACE VERBOSE

autoload -U is-at-least

eval $(dircolors -b)

# Fix main_highlighter issue
# see https://github.com/robbyrussell/oh-my-zsh/issues/4664
# local interactive_comments= # set to empty

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
    # zgen load unixorn/autoupdate-zgen

    zgen oh-my-zsh

    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-completions

    if is-at-least 4.3.17; then
      zgen oh-my-zsh plugins/colored-man-pages
      zgen load zsh-users/zsh-syntax-highlighting
      zgen load zsh-users/zsh-autosuggestions
    fi

    zgen load nojhan/liquidprompt

    # zgen load zsh-users/zsh-history-substring-search
    # zgen oh-my-zsh plugins/git
    # zgen oh-my-zsh plugins/history-substring-search
    # zgen load mafredri/zsh-async
    # zgen load sindresorhus/pure
    # zgen load dfurnes/purer
    # zgen load therealklanni/purity

    zgen save
fi

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# # Auto suggestions configuration
# # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE
# # ZSH_AUTOSUGGEST_STRATEGY
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# ZSH_AUTOSUGGEST_USE_ASYNC=1
# 
# #-------------------------------------------------------------------------------
# # Oh-my-zsh
# #-------------------------------------------------------------------------------
# DISABLE_AUTO_TITLE="true"
# COMPLETION_WAITING_DOTS="true"
# 
# #-------------------------------------------------------------------------------
# # Misc
# #-------------------------------------------------------------------------------
# PROMPT_EOL_MARK=""
# 
# autoload -U compinit && compinit
# 
# zstyle ':completion:*' menu select=2
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# 
# # zmv - a command for renaming files by means of shell patterns
# # http://zshwiki.org/home/builtin/functions/zmv
# autoload -U zmv
# alias zmv='noglob zmv -W'
# 
# # automatically remove duplicates from these arrays
# typeset -U path cdpath fpath manpath
# 
# # cd will never select the parent directory (e.g.: cd ../<TAB>)
# zstyle ':completion:*:cd:*' ignore-parents parent pwd
# 
# # provide .. as a completion
# zstyle ':completion:*' special-dirs ..
# 
# # ctrl-x-e to open current line in $EDITOR, awesome when writting functions
# # or editing multiline commands.
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^x^e' edit-command-line
# 
# # nobody need flow control anymore
# setopt noflowcontrol
# 
# # we don't want to quote/espace URLs on our own...
# if autoload -U url-quote-magic; then
#   zle -N self-insert url-quote-magic
#   zstyle ':url-quote-magic:*' url-metas '*?[]^()~#{}='
# fi
# 
# # whenever a command completion is attempted, make sure the entire command path
# # is hashed first.
# setopt hash_list_all
# 
# # don't share history
# unsetopt share_history
# 
# # don't exit interactive sessions
# set ignoreeof on
# 
# # automatic rehash
# zstyle ':completion:*' rehash true
# 
# # turn on command substitution in the prompt (and parameter expansion and
# # arithmetic expansion)
# setopt prompt_subst
# 
# # ignore lines prefixed with '#'.
# setopt interactivecomments
# 
# #-------------------------------------------------------------------------------
# # Keys
# #-------------------------------------------------------------------------------
# bindkey "^[OH" beginning-of-line
# bindkey "^[OF" end-of-line
# 
# umask 027
# 
# #-------------------------------------------------------------------------------
# # Aliases
# #-------------------------------------------------------------------------------
# 
# alias ack='ack-grep'
