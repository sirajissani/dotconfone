#!/bin/bash

#To use this script, set the argument to last unique character set
#For Google Chrome, this is Chrome "./bluetooth_pause.sh Chrome"
#For MPV, this is mpv "./bluetooth_pause.sh mpv"
#
#Play-Pause is converted to "space" bar hits
#Previous-Next is mapped to "Left"/"Right" key hits

WINDOW_ID=$1

if [ "$WINDOW_ID" == "" ]; then
   echo "Argument missing"
   exit
fi

dbus-monitor |grep -A1 -i mpris --line-buffered|grep -i string --line-buffered |grep -iv mpris --line-buffered |
while read -r line; do
    echo $line
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
    xdotool windowfocus $input_window  2> /dev/null > /dev/null && xdotool key $key_press
    if [ $? -ne 0 ]; then
        echo $input_window
        xdotool windowactivate $input_window
        xdotool windowfocus $input_window
        xdotool key $key_press
        xdotool windowminimize $input_window
    fi
    xdotool windowfocus $curwindow
done

