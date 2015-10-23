#!/bin/zsh

#-------------------------------------------------------------------------------
# Antigen plugin manager
#-------------------------------------------------------------------------------
if [[ ! -d  $HOME/.antigen.git ]]; then
  git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
fi

# ADOTDIR
# This directory is used to store all the repo clones, your bundles, themes,
# caches and everything else antigen requires to run smoothly. Defaults to
# $HOME/.antigen

source $HOME/.antigen.git/antigen.zsh

antigen use oh-my-zsh

antigen bundle git

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

#-------------------------------------------------------------------------------
# Misc
#-------------------------------------------------------------------------------

eval `dircolors -b`

### #-------------------------------------------------------------------------------
### # Completion
### #-------------------------------------------------------------------------------
### 
### autoload -Uz compinit && compinit
### 
### zstyle ':completion:*' use-cache on
### zstyle ':completion:*' cache-path ~/.zsh_cache
### 
### # Fuzzy matching
### zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
### # zstyle ':completion:*' completer _complete _match _approximate
### zstyle ':completion:*:match:*' original only
### zstyle ':completion:*:approximate:*' max-errors 2 numeric
### 
### zstyle ':completion:*' group-name ''
### zstyle ':completion:*' list-dirs-first on
### zstyle ':completion:*:matches' group on
### zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
### zstyle ':completion:*' use-compctl false
### 
### zstyle ':completion:*' menu select
### 
### zstyle ':completion:*' format "%B%F{white}--- %U%d%u%f%b"
### zstyle ':completion:*:corrections' format "%B%F{white}--- %d (errors %e)%f%b"
### zstyle ':completion:*:descriptions' format "%B%F{white}--- %d%f%b"
### zstyle ':completion:*:messages' format "%B%F{white}%U--- %d%u%f%b"
### zstyle ':completion:*:warnings' format "%B%F{red}--- no match for: %f%d%b"
### 
### zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
### 
### # Complete kill(all) commands
### zstyle ':completion:*:*:kill:*' menu yes select
### zstyle ':completion:*:kill:*' force-list always
### zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)[ 0-9:]#([^ ]#)*=01;30=01;31=01;38'
### 
### zstyle ':completion:*:*:killall:*' menu yes select
### zstyle ':completion:*:killall:*'   force-list always
### 
### # Complete SSH hosts
### zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
### 
### setopt auto_menu
### setopt menu_complete
### setopt correct
### setopt correctall
### 
### zstyle ':completion:*' rehash true
### 
### #-------------------------------------------------------------------------------
### # History
### #-------------------------------------------------------------------------------
### 
### export HISTSIZE=2000
### export SAVEHIST=$HISTSIZE
### export HISTFILE=~/.zsh_history
### 
### # Allow mutliple zsh to append to the same history
### setopt append_history
### 
### # Append without waiting shell exit
### setopt inc_append_history
### 
### # setopt share_history
### 
### setopt hist_reduce_blanks
### setopt hist_ignore_dups
### setopt hist_save_no_dups
### setopt hist_verify
### 
### #-------------------------------------------------------------------------------
### # Options
### #-------------------------------------------------------------------------------
### 
### setopt autocd
### 
### # Don't beep on error
### setopt no_beep
### 
### # Allow comments in interactive shells
### setopt interactive_comments
### 
### # Don't push duplicates in directory stack
### setopt pushd_ignore_dups
### 
### # Treat #, ~, and ^ as part of patterns for filename generation
### setopt extended_glob
### 
### setopt chase_links
### setopt print_exit_value
### setopt auto_continue
### setopt no_hup
### setopt notify
### setopt multios
### 
### # Report the status of background and suspended jobs before exiting a shell
### # with job control; a second attempt to exit the shell will succeed.
### setopt check_jobs
### 
### # If a parameter is completed whose content is the name of a directory,
### # then add a trailing slash instead of a space.
### setopt auto_param_slash
### 
### # Treat single word simple commands without redirection
### # as candidates for resumption of an existing job.
### setopt auto_resume
### 
### source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
### ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
### ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
### 
### source $HOME/dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh
### 
### # bind UP and DOWN arrow keys
### zmodload zsh/terminfo
### bindkey "$terminfo[kcuu1]" history-substring-search-up
### bindkey "$terminfo[kcud1]" history-substring-search-down
### 
### # bind UP and DOWN arrow keys (compatibility fallback
### # for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
### bindkey '^[[A' history-substring-search-up
### bindkey '^[[B' history-substring-search-down
### 
### # bind P and N for EMACS mode
### bindkey -M emacs '^P' history-substring-search-up
### bindkey -M emacs '^N' history-substring-search-down
### 
### # bind k and j for VI mode
### bindkey -M vicmd 'k' history-substring-search-up
### bindkey -M vicmd 'j' history-substring-search-down
### 
### #-------------------------------------------------------------------------------
### # Prompt
### #-------------------------------------------------------------------------------
### 
### autoload -Uz colors
### autoload -Uz vcs_info
### 
### setopt prompt_subst
### 
### colors
### 
### zstyle ':vcs_info:*' enable git svn hg
### zstyle ':vcs_info:*' check-for-changes true
### zstyle ':vcs_info:*' check-for-staged-changes true
### zstyle ':vcs_info:*' get-revision true
### 
### zstyle ':vcs_info:*' stagedstr   "%B%F{green}*%f%b"
### zstyle ':vcs_info:*' unstagedstr "%B%F{red}*%f%b"
### 
### vcs_info_format="(%s:%F{cyan}%b%f%u%c%m)"
### 
### zstyle ':vcs_info:*' actionformats "${vcs_info_format}%F{red}%a%f"
### zstyle ':vcs_info:*' formats       "${vcs_info_format}"
### 
### unset vcs_info_format
### 
### zstyle ':vcs_info:git*+set-message:*' hooks git-st git-untracked
### 
### # git: display untracked files
### +vi-git-untracked() {
###   if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
###     git status --porcelain | grep '??' &> /dev/null ; then
###       #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
###       hook_com[staged]+='?'
###   fi
### }
### 
### # git: compare local changes to remote changes
### +vi-git-st() {
###   # local ahead behind
###   # local -a gitstatus
### 
###   # for git < 1.7
###   # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
###   # ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
###   # (( $ahead )) && gitstatus+=( "+${ahead}" )
### 
###   # for git < 1.7
###   # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
###   # behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
###   # (( $behind )) && gitstatus+=( "-${behind}" )
### 
###   # hook_com[misc]+=${(j:/:)gitstatus}
### }
### 
### precmd () {
###   vcs_info
### 
###   header_prompt="%B%F{yellow}%t%f%b [%n@%U%m%u %B%F{white}%${pwd_len}~%f%b]"
###   # status_prompt="%(?. . %B%F{red}%?%f%b )"
### 
###   if [[ -n ${vcs_info_msg_0_} ]]; then
###     pwd_len=3
###     git_prompt=" ${vcs_info_msg_0_}"
### 
###   else
###     pwd_len=6
###     git_prompt=" "
###   fi
### 
###   status_prompt="%B%(?.%F{white}.%F{red})${PROMPT_SYMBOL:-❯}%f%b "
### 
###   PS1='${header_prompt}${git_prompt} ${status_prompt}'
### }
### 
### #-------------------------------------------------------------------------------
### # Alias
### #-------------------------------------------------------------------------------
### alias ll='ls -l --color=auto'
### alias la='ls -A --color=auto'
### alias l='ls -CF --color=auto'
### alias tree='tree --dirsfirst -C'
### alias mozilla='firefox'
### alias grep='grep --colour=auto'
### alias egrep='egrep --colour=auto'
### alias ls='ls --color=auto --human-readable --group-directories-first --classify'

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
