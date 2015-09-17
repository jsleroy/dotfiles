#!/bin/zsh

source $HOME/.zshrc.arm

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

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

export ZLE_RPROMPT_INDENT=0
export RPROMPT="%{*%}"

autoload -Uz colors && colors

source ~/dotfiles/promptline.sh

# autoload -Uz promptinit && promptinit
# 
# rst="%{$reset_color%}"
# pcc[1]="%{$reset_color${fg_no_bold[red]}%}"
# pcc[2]="%{$reset_color${fg_no_bold[magenta]}%}"
# 
# test -x $(which dircolors) && test -f ~/.dir_colors && eval "`dircolors -b ~/.dir_colors`"
# 
# #preexec
# if [ "$TERM" != "linux" ]; then
# 	preexec () {
# 		print -Pn "\e]0;%n@%m: $1\a"
# 	}
# fi
# 
# precmd () {
# 	if [ "$TERM" != "linux" ]; then
# 		print -Pn "\e]0;%n@%m: %~\a"
# 	fi
# 
# 	[ -n "$_VCSPROMPT_NONE" ] && return
# 
# 	local git_dir branch
# 	psvar=()
# 	if [ "$(git rev-parse --is-bare-repository 2>/dev/null)" = "false" ]; then
# 		git_dir=$(git rev-parse --git-dir)
# 		if [ -d "$git_dir/rebase-apply" ]; then
# 			if [ -f "$git_dir/rebase-apply/rebasing" ]; then
# 				psvar[2]="rebase"
# 			elif [ -f "$git_dir/rebase-apply/applying" ]; then
# 				psvar[2]="am"
# 			else
# 				psvar[2]="am/rebase"
# 			fi
# 			branch="$(git symbolic-ref HEAD 2>/dev/null)"
# 		elif [ -d "$git_dir/rebase-merge/" ]; then
# 			if [ -f "$git_dir/rebase-merge/interactive" ]; then
# 				psvar[2]="rebase -i"
# 			else
# 				psvar[2]="rebase -m"
# 			fi
# 			read -r branch < "$git_dir/rebase-merge/head-name"
# 		elif [ -f "$git_dir/MERGE_HEAD" ]; then
# 			psvar[2]="merge"
# 			branch="$(git symbolic-ref HEAD 2>/dev/null)"
# 		else
# 			test -f "$git_dir/BISECT_LOG" && psvar[2]="bisect"
# 			branch="$(git symbolic-ref HEAD 2>/dev/null)" || \
# 			  branch="$(git describe --exact-match HEAD 2>/dev/null)" || \
# 			  branch="$(read -re -k 7 -u 0 < "$git_dir/HEAD")..."
# 		fi
# 		psvar[1]="${branch#refs/heads/}"
# 
# 		UC=""
# 		if [ ! -n "$_VCSPROMPT_FAST" ]; then
# 			git diff --exit-code > /dev/null 2>&1
# 			[ $? -eq 1 ] && UC="*"
# 		fi
# 		git diff --cached --exit-code > /dev/null 2>&1
# 		[ $? -eq 1 ] && UC="$UC+"
# 		[ -n "$UC" ] && psvar[2]="${psvar[2]}$UC"
# 	elif [ -d .svn ]; then
# 		git_dir=$(svn info | grep Revision)
# 		psvar[1]="svn|${git_dir/Revision: /r}"
# 	fi
# }
# 
# add_prompt=
# 
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
# 	debian_chroot=$(cat /etc/debian_chroot)
# 	add_prompt=" $fg[green]${debian_chroot:+($debian_chroot)}$rst"
# fi
# 
# [ -n "$SSH_CONNECTION" ] && add_prompt="${add_prompt} @%m"
# 
# if [ -n "$WINDOW" ]; then
# 	screen_no=$(ls -1 /var/run/screen/S-$USER | grep -n $STY)
# 	add_prompt="${add_prompt} (#${screen_no%:*}:${WINDOW})"
# fi
# 
# if [ "`id -u`" -eq 0 ]; then
# 	export PS1="[%T %~]%# "
# else
# 	export PS1="${pcc[1]}[%T${add_prompt-} ${pcc[2]}%~%(1v.:%U%1v%(2v.|%B%2v%b.)%u.)${pcc[1]}]%#$rst "
# fi
# 
# unset pcc add_prompt rst debian_chroot screen_no

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
