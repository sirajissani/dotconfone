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

function foobar_handler {
    #Needs full path. ~ does not work
    FOOBAR_EXE="/home/csghone/Desktop/foobar2000/foobar2000.exe"
    if [ "$2" == "space" ]; then
        wine $FOOBAR_EXE /playpause 2> /dev/null
    fi
    if [ "$2" == "Right" ]; then
        wine $FOOBAR_EXE /stop 2> /dev/null
        wine $FOOBAR_EXE /playpause 2> /dev/null
        wine $FOOBAR_EXE /next 2> /dev/null
    fi
    if [ "$2" == "Left" ]; then
        wine $FOOBAR_EXE /prev 2> /dev/null
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
    if [ "$3" == "foobar" ]; then
        foobar_handler $1 $key_press
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

#This is needed for TMUX/BYOBU
DBUS_ID=`echo $DBUS_SESSION_BUS_ADDRESS |grep -o "/tmp/[^,]*"`
lsof -c dbus-daemon | grep $DBUS_ID > /dev/null
if [ $? -ne 0 ]; then
    DBUS_LAUNCHER="mate-settings-daemon"
    echo Connecting to DBUS session of $DBUS_LAUNCHER
    echo Change in script if needed!
    DBUS_LAUNCHER_PID=`pidof $DBUS_LAUNCHER`
    export `cat /proc/$DBUS_LAUNCHER_PID/environ | grep -z DBUS_SESSION_BUS_ADDRESS`
fi
dbus-monitor --session |grep -A1 -i mpris --line-buffered|grep -i string --line-buffered |grep -iv mpris --line-buffered |
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
        xdotool windowactivate $input_window 2> /dev/null
        xdotool windowfocus $input_window 2> /dev/null
        command_handle $input_window $key_press $MODE 2> /dev/null
        xdotool windowminimize $input_window 2> /dev/null
    fi
    xdotool windowactivate $curwindow 2> /dev/null
    xdotool windowfocus $curwindow
done

