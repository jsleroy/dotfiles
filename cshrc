#
# ~/.cshrc
#

if (($?prompt) || !($?term) || ($?SSH_CLIENT)) then
    set remote
endif

source /arm/scratch/pktools/init/init.csh
pk reload

######################################################
#       Customization                                #
######################################################

#set prompt="%B[%h]%b %# "
#set prompt2="%B>%b "

set history=250
set savehist=250
set autolist
set nobeep
set rmstar
set symlinks=ignore

umask 027
unset autologout

set prompt = "%{\033[00;33m%}%B[%h] %{\033[00;37m%}%.2%{\033[01;35m%}%# "

