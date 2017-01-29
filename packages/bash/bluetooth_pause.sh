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
    if [ "$line" == "string \"Play\"" ]; then
        xdotool windowfocus `xdotool search --name ".*$WINDOW_ID$"` && xdotool key space
    fi
    if [ "$line" == "string \"Pause\"" ]; then
        xdotool windowfocus `xdotool search --name ".*$WINDOW_ID$"` && xdotool key space
    fi
    if [ "$line" == "string \"Previous\"" ]; then
        xdotool windowfocus `xdotool search --name ".*$WINDOW_ID$"` && xdotool key Left
    fi
    if [ "$line" == "string \"Next\"" ]; then
        xdotool windowfocus `xdotool search --name ".*$WINDOW_ID$"` && xdotool key Right
    fi
done

