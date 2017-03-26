#!/bin/bash

#To use this script, set the argument to last unique character set of window title
#For Google Chrome, this is Chrome "./bluetooth_pause.sh Chrome"
#For Google Chrome + Jango, this is "./bluetooth_pause.sh Chrome jango"
#For MPV, this is mpv "./bluetooth_pause.sh mpv"
#
#Play-Pause is converted to "space" bar hits
#Previous-Next is mapped to "Left"/"Right" key hits

WINDOW_ID=$1
MODE=$2
if [ "$MODE" == "" ]; then
    MODE=none
fi
DUMMY_WINDOW=000000

window_id=`xdotool search --name ".*$WINDOW_ID$"`
window_name=`xdotool getwindowname $window_id`
echo Selecting window: $window_name
echo Selecting mode: $MODE

function jango_handler {
    if [ "$1" == "$DUMMY_WINDOW" ]; then
       echo "Cannot find window!!"
       return
    fi
    if [ "$2" == "space" ]; then
        xdotool key Ctrl+l && xdotool type "javascript:this._jp.ctrls.onPlayPause(0)" && xdotool key KP_Enter
    fi
    if [ "$2" == "Right" ]; then
        xdotool key Ctrl+l && xdotool type "javascript:this._jp.ctrls.onNext()" && xdotool key KP_Enter
    fi
    if [ "$2" == "Left" ]; then
        xdotool key Ctrl+r
    fi
}

function youtube_handler {
    if [ "$1" == "$DUMMY_WINDOW" ]; then
       echo "Cannot find window!!"
       return
    fi
    if [ "$2" == "space" ]; then
        xdotool key Ctrl+l && xdotool type "javascript:document.getElementsByClassName(\"ytp-play-button\")[0].click()" && sleep 0.1 && xdotool key KP_Enter
    fi
    if [ "$2" == "Right" ]; then
        xdotool key Ctrl+l && xdotool type "javascript:document.getElementsByClassName(\"ytp-next-button\")[0].click()" && sleep 0.1 && xdotool key KP_Enter
    fi
    if [ "$2" == "Left" ]; then
        xdotool key Alt+Left
    fi
}

function mpv_handler {
    if [ "$2" == "space" ]; then
      echo '{"command":["keypress", "p"]}' | socat - /tmp/mpvsocket
    fi
    if [ "$2" == "Right" ]; then
      echo '{"command":["keypress", "Right"]}' | socat - /tmp/mpvsocket
    fi
    if [ "$2" == "Left" ]; then
      echo '{"command":["keypress", "Left"]}' | socat - /tmp/mpvsocket
    fi
}

function command_handle {
    if [ "$3" == "yt" ]; then
        youtube_handler $1 $key_press
    fi
    if [ "$3" == "jango" ]; then
        jango_handler $1 $key_press
    fi
    if [ "$3" == "mpv" ]; then
        mpv_handler $1 $key_press
    fi
    if [ "$3" == "none" ]; then
        if [ "$1" == "$DUMMY_WINDOW" ]; then
           echo "Cannot find window!!"
           return
        fi
        xdotool key $key_press
    fi
}

if [ "$WINDOW_ID" == "" ]; then
   echo "Argument missing"
   exit
fi

dbus-monitor |grep -A1 -i mpris --line-buffered|grep -i string --line-buffered |grep -iv mpris --line-buffered |
while read -r line; do
    #echo $line
    if [ "$line" == "string \"Play\"" ]; then
        key_press=space
    fi
    if [ "$line" == "string \"Pause\"" ]; then
        key_press=space
    fi
    if [ "$line" == "string \"Previous\"" ]; then
        key_press=Left
    fi
    if [ "$line" == "string \"Next\"" ]; then
        key_press=Right
    fi
    curwindow=`xdotool getwindowfocus`
    input_window=`xdotool search --name ".*$WINDOW_ID$"`
    if [ "$input_window" == "" ]; then
        input_window=$DUMMY_WINDOW
    fi
    xdotool windowfocus $input_window 2> /dev/null > /dev/null && command_handle $input_window $key_press $MODE
    if [ $? -ne 0 ]; then
        xdotool windowactivate $input_window
        xdotool windowfocus $input_window
        command_handle $input_window $key_press $MODE
        xdotool windowminimize $input_window
    fi
    xdotool windowfocus $curwindow
done

