# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2 not-numeric
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '[%e] '
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/siraj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Environment
export PS_PERSONALITY='linux'
export TERM=xterm
export SHELL=/bin/zsh
export LD_LIBRARY_PATH=/usr/local/lib

# Modules
zmodload zsh/complist
autoload -U colors   
colors            
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -ap zsh/mapfile mapfile
umask 0022

# Shell exports
export EDITOR="gvim"
setopt PROMPT_SUBST
PROMPT='%{${fg[red]}%}[%{${fg[green]}%}%D{%H:%M}%{${fg[red]}%}][%{${fg[yellow]}%}%1/%{${fg[red]}%}]%{${fg[green]}%}$ %{${fg[default]}%}'
export PATH=/usr/local/share/perl/5.10.0/auto/share/dist/Cope:$PATH:/home/siraj/bin
export PYTHONSTARTUP=$HOME/.pythonrc
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Proxy exports
export http_proxy=http://144.16.192.247:8080
export ftp_proxy=http://144.16.192.247:8080

# Don't expand files matching:
fignore=(.o .c~ .old .aux .bak)

# incremental-search
bindkey '^S' history-incremental-search-forward
bindkey '^R' history-incremental-search-backward
bindkey '^?' backward-delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey -M vicmd 'u' undo

# zsh aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# -- some useful functions --

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

# For autojump
source /etc/profile.d/autojump.zsh

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
