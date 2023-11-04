# enable color support of ls and also add handy aliases

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='LC_COLLATE=C ls -h --group-directories-first --color=auto'

    alias grep='grep -E --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Make pgrep list process names with full command line
alias pgrep='pgrep -fl'

#Use Extended Regular Expressions!
# makes auto-completion of bash messy in some cases!
# Commenting till we find a work-around
#alias sed='sed -r'

# some more ls aliases
alias ll="ls -CFlh -Itags -I'cscope*'"
function lsd
{
    if [ -z "$1" ]
    then
        ls -d */
    else
        find $1 -maxdepth 1 -type d -printf '%f\n' | sed -n '2,$p'
    fi
}
alias la='ls -ACh --classify'
alias lc="ls -Ch --classify -Itags -I'cscope*'"
alias lal='ls -lAh --classify'
alias l="ls -Ch --classify -Itags -I'cscope*'"
alias t='tree -aC'
alias td='tree -daC'

#Interpret ANSI Color sequences in stdin
#Case insensitive searching if search string
#contains only lowercase letters => smartcase
export LESS=' -R -i'
export LESSOPEN="| `which src-hilite-lesspipe.sh` %s"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# make commands verbose
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -p -v'
alias rmdir='rmdir -p -v'

# human readable!
alias df='df -Th'
alias du='du'

# terminal friendly application aliases
alias vlc='vlc -I ncurses'
alias nautilus='nautilus --browser --no-desktop'
alias vi='gvim --remote-silent'

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#HTTP Mirroring using wget
alias httpmirror='wget --tries 7 --waitretry=30 --wait=5 --random-wait --user-agent="" --mirror --no-parent --page-requisites --convert-links --recursive --level=6'

#Conky Stuff
alias lyr='conky -c ~/.conkyrc_lyrics &> /dev/null'
alias con='conky -c ~/.conkyrc &> /dev/null'

# List top level directory sizes under the current directory
alias dsl='find -maxdepth 1 -type d -exec du '{}' -s \; | sort -nr'

#Download videos from youtube
#b: best quality
#i: ignore errors
alias ytdl='youtube-dl -bi -o "%(title)s.%(ext)s"'

#Matlab
#alias matlab='/home/chillu/matlab/bin/matlab'

#Lock Screen
alias lock='xscreensaver-command -lock'

#Suspend and Hibernate
alias suspend='sudo pm-suspend --quirk-radeon-off'
alias hibernate='sudo hibernate --force'

#Simple directory sharing over LAN
alias webshare='python -m SimpleHTTPServer'

#VNC
alias myvncviewer='vncviewer localhost:0 -compresslevel 6 -quality 6 -depth 16'
alias myvncserver='x11vnc -display :0 -usepw -forever -ncache 10 -scale 0.75 -noxdamage'

#Watch current directory for changes with most recent at the top
alias mywatch='watch -n1 tree -sht'

#vim pager
alias vmore="vim -u ~/.vimrc -"

#hexdump
alias hd='od -Ad -tx1z -w16 -v'

#cal
alias cal='cal -3m'
psu(){ command ps -Hcl -F S f -u ${1:-$USER}; }

#info
alias info='info --vi-keys'

#wireless
alias wfind='sudo iwlist wlp3s0 scan | grep "(ESSID|Quality)"'

#mpd mpc
alias mpdinit='sudo /etc/init.d/mpd'
alias mplay='mpc -h 192.168.1.5 play'
alias mpause='mpc -h 192.168.1.5 pause'
alias mstop='mpc -h 192.168.1.5 stop'
alias mpch='mpc -h 192.168.1.5'

alias gdb='gdb -q'
alias ssh='ssh -X'
#SSH with compression
alias sshc='ssh -XC -c blowfish-cbc,arcfour'

alias myeclipse='GTK2_RC_FILES=~/.gtkrc-eclipse ~/programs/eclipse/eclipse'
alias mysource="find \`pwd\` -regex '.*\.[i,c,h][n,p]?[l,p]?$'"
unalias vi
alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'
alias fixtmux='stty sane; printf "\033k%s\033\\\033]2;%s\007" "$(basename "$SHELL")" "$(uname -n)"; tput reset; tmux refresh; tmux rename-window ,,,'

alias dr='docker run -it --rm -v${PWD}:${PWD} -w ${PWD}'

function smssflash {
  echo "Executing: \"STM32_Programmer_CLI -c port=SWD reset=HWrst -d \"$1\" 0x08000000 -v -hardRst\""
  STM32_Programmer_CLI -c port=SWD reset=HWrst -d "$1" 0x08000000 -v -hardRst
}

function finf() {
  searchdir=""
  if [ $# -ge 2 ]; then
    searchdir="$2"
  fi

  filepattern=""
  if [ $# -ge 3 ]; then
    filepattern="-regextype grep -iregex '$3'"
  fi

  key="\"$1\""

  echo "find ${searchdir} -type f ${filepattern} | xargs grep -EHni --color=auto ${key}"
  find ${searchdir} -type f ${filepattern} | xargs grep -EHni --color=auto ${key}
}
