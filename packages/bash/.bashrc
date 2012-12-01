# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#Fortune Cookie
#fortune 50% hitchhiker 20% computers 20% food 10% men-women

# Remind me!
# if [ -f ~/.reminders ]; then
#     /usr/bin/remind
# fi

source /etc/profile

# The AWESOME vi mode (Use Esc)
set -o vi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#CDPATH: Look in these places in this order for "cd"ing
#export CDPATH=:..:~:~/down:~/doc

## BashHistory options
## No duplicates in the history
export HISTCONTROL=ignoredups
export HISTSIZE=100000
## Timestamp history
export HISTTIMEFORMAT="%b %d %a %T "
#export HISTFILE="~/.bash_history"
## Don't Overwrite. Append to bash history.
shopt -s histappend
## -a: Append lines to bash
## -n: Read history
## everytime bash prompt appears
#export PROMPT_COMMAND="history -a; history -n;"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_colored_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Bash aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#custom green colored PS1 prompt
#export PS1="\[\033[0;32m\][\$(date +%H:%M)][\u@\h \W]$\[\033[0m\] "
export PS1="\[\e[31m\][\[\e[32m\]\$(date +%H:%M)\[\e[31m\]][\[\e[33m\]\h: \W\[\e[31m\]]\[\e[32m\]$\[\e[0m\] "
#export PS1="\[\e[37m\][$(date +%H:%M)][\W]\[\e[37m\]\[\e[0m\] "
#I designed that! [Removed the useless hostname info]

#Add local binaries
PATH=$PATH:/home/siraj/Documents/Programs/bash/:/usr/local/bin/:./:/usr/share/pk2
export PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

#Python <TAB> Completion
export PYTHONSTARTUP="$HOME/.pythonrc"

#*Bright* ls colors to suit a dark background
#eval `/usr/bin/dircolors -b /home/siraj/.dircolors`

export EDITOR=gvim
export TERM=xterm-256color

#Extract most common archives
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#Python calculator
alias pc='python -ic "from __future__ import division; from math import *"'

#netinfo - shows network information for your system
netinfo ()
{
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    /sbin/ifconfig | awk /'inet addr/ {print $4}'
    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
    echo "${myip}"
    echo "---------------------------------------------------"
}

# Extras in vi-mode in bash
# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

# for colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Environment variables and Command completion with sudo
alias sudo="sudo -E"
complete -cf sudo

# For autojump
# source /etc/profile.d/autojump.bash

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/

#apt-get history
function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}
