#------------------------------------------------------------
# .zshrc
#------------------------------------------------------------

# Autoloads
autoload -U compinit colors

compinit
colors

# PS1
PROMPT="%{$fg[blue]%}%m${reset_color%}:%{$fg[green]%}%*${reset_color}:%B%~%b%#"

# Number of lines kept in history
export HISTSIZE=1000

# Number of lines saved in the history after logout
export SAVEHIST=1000

# Location of history
export HISTFILE=~/.zhistory

# Append command to history file once executed
setopt inc_append_history

# Cache completion results
zstyle ':completion::complete:*' use-cache 1

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# setopt completealiases

# Colorize STDERR
exec 2>>(while read line; do
  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

## for sharing history between zsh processes

## never ever beep ever
# setopt NO_BEEP

## automatically decide when to page a list of completions
# LISTMAX=0

## disable mail checking
# MAILCHECK=0

## keep background processes at full speed
#setopt NOBGNICE

## restart running processes on exit
#setopt HUP

# history
setopt APPEND_HISTORY
# setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY

