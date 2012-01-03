#
# ~/.cshrc
#

# source /arm/scratch/pktools/init/init.csh
# pk reload

if (($?prompt) || !($?term) || ($?SSH_CLIENT)) then
    set remote
endif

source /home/jealer01/.cshrc.arm

# source /home/jealer01/.aliases
alias ls="ls --color=auto -h" #enable thousands grouping and colour
alias ll='ls -l'
alias lla='ls -l -A'

######################################################
#       Customization                                #
######################################################

#set prompt="%B[%h]%b %# "
#set prompt2="%B>%b "

umask 027

set history=1000
set savehist=1000
set autolist
set nobeep
set rmstar
set symlinks=ignore
set addsuffix		# add / to directories, ' ' otherwise, for file completion
set autocorrect	        # correct mis-spelled path components before completion
set autoexpand	        # invoke expand-history function automatically
unset autologout	# autologout after <parm1> mins
#set chase_symlinks	# resolve links on cd etc
set correct=cmd	        # auto-correct either the command or whole line
set dextract		# extract rather than rotate on pushd
#set fignore		# list of file suffices to ignore during completion
set listjobs=long	# list all jobs on suspension
set listlinks		# resolve links with correct file type
#set listmax		# max items to list without clarification
set matchbeep=never	# [nomatch|ambiguous|notunique|never]
set pushdtohome	        # pushd with no args does a cd ~
set pushdsilent	        # don't print the stack
set showdots		# show hidden files in list and completion
set ignoreeof		# stop EOF shell logout
set filec		# filename complettion
set norebind		

set prompt="%{\033[00;33m%}%B[%h] %{\033[00;37m%}%.2%{\033[01;35m%}%# "

