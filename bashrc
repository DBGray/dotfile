#=============================================================================
#     FileName: .bashrc
#         Desc: Bash shell config file.
#       Author: David Gray
#        Email: david.gray@dr-inc.com
#     HomePage: http://www.dr-inc.com
#      Version: 0.0.1
#   LastChange: 2012-06-01 16:39:58
#      History:
#=============================================================================
# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# git tab complete and prompt
source /etc/bash_completion.d/git.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWDIRTYSTATE=1

export PATH=$PATH:/home/david.gray/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/usr/lib64/jvm/jre/bin:/home/david.gray/osg/osgearth/bin/:/home/david.gray/osg/3.0.1/bin/

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/david.gray/osg/osgearth/lib64/:/home/david.gray/osg/3.0.1/lib64/:/home/david.gray/lib64/

alias gitp='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --color'
umask 0002
