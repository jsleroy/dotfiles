#!/bin/zsh

[ -f $HOME/.zshrc.arm ] && source $HOME/.zshrc.arm

#-------------------------------------------------------------------------------
# Env
#-------------------------------------------------------------------------------

export TERM="xterm-256color"
export EDITOR="vim"
export PATH="${HOME}/bin:${PATH}"
export PYTHONPATH="${HOME}/python:${PYTHONPATH}"
export PYTHONSTARTUP="${HOME}/.pystartup"

#-------------------------------------------------------------------------------
# Misc
#-------------------------------------------------------------------------------

# Vi/Emacs mode
# bindkey -v
bindkey -e

# Core dumps
ulimit -c unlimited

#-------------------------------------------------------------------------------
# Completion
#-------------------------------------------------------------------------------

autoload -Uz compinit && compinit

# Completion cache
rst="%{$reset_color%}"

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

# Fuzzy matching
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
# zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 2 numeric

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first on
zstyle ':completion:*:matches' group on
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-compctl false

zstyle ':completion:*' menu select

zstyle ':completion:*' format "$rst%B--- %U%d%u%b"
zstyle ':completion:*:corrections' format "$rst%B--- %d (errors %e)%b"
zstyle ':completion:*:descriptions' format "$rst%B--- %d%b"
zstyle ':completion:*:messages' format "$rst%B%U--- %d%u%b"
zstyle ':completion:*:warnings' format "$rst%B$fg[red]%}--- no match for: $fg[white]%d%b"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Complete kill(all) commands
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)[ 0-9:]#([^ ]#)*=01;30=01;31=01;38'

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

# Complete SSH hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

unset rst

setopt auto_menu
setopt menu_complete
setopt correct
setopt correctall

zstyle ':completion:*' rehash true

#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------

export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history

# Allow mutliple zsh to append to the same history
setopt append_history

# Append without waiting shell exit
setopt inc_append_history

setopt share_history

setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_verify

#-------------------------------------------------------------------------------
# Options
#-------------------------------------------------------------------------------

setopt autocd

# Don't beep on error
setopt no_beep

# Allow comments in interactive shells
setopt interactive_comments

# Don't push duplicates in directory stack
setopt pushd_ignore_dups

# Treat #, ~, and ^ as part of patterns for filename generation
setopt extended_glob

setopt chase_links
setopt print_exit_value
setopt auto_continue
setopt no_hup
setopt notify
setopt multios

# Report the status of background and suspended jobs before exiting a shell
# with job control; a second attempt to exit the shell will succeed.
setopt check_jobs

# If a parameter is completed whose content is the name of a directory,
# then add a trailing slash instead of a space.
setopt auto_param_slash

# Treat single word simple commands without redirection
# as candidates for resumption of an existing job.
setopt auto_resume

source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

source $HOME/dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

autoload -Uz colors
autoload -Uz vcs_info

setopt prompt_subst
colors

zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true

zstyle ':vcs_info:*' stagedstr   "%{$fg_no_bold[green]%}*%{$reset_color%}"
zstyle ':vcs_info:*' unstagedstr "%{$fg_no_bold[red]%}*%{$reset_color%}"

vcs_info_format="(%s:%{$fg_no_bold[yellow]%}%b%{$reset_color%}%u%c%m)"

zstyle ':vcs_info:*' actionformats "${vcs_info_format}%{$fg_no_bold[red]%}%a%{$reset_color%}"
zstyle ':vcs_info:*' formats       "${vcs_info_format}"

precmd () {
  vcs_info

  local pwd_len
  [[ -n ${git_prompt} ]] && pwd_len=5 || pwd_len=3

  local pwd_prompt="%{$fg_bold[white]%}%${pwd_len}~%{$reset_color%}"

  header_prompt="%{$fg_bold[yellow]%}%t%{$reset_color%} [%n@%m ${pwd_prompt}]"
  git_prompt=${vcs_info_msg_0_}
  status_prompt="%(?. . %{$fg_bold[red]%}%?%{$reset_color%} )"
}

PS1='${header_prompt} ${git_prompt} %#${status_prompt}'

unset vcs_info_format
unset header_prompt
unset git_prompt
unset status_prompt

#-------------------------------------------------------------------------------
# Alias
#-------------------------------------------------------------------------------
eval `dircolors -b`

alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias tree='tree --dirsfirst -C'
alias mozilla='firefox'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
