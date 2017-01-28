#!/bin/bash

#!/bin/bash

dbus-monitor |grep -A1 -i mpris --line-buffered|grep -i string --line-buffered |grep -iv mpris --line-buffered |
while read -r line; do
    if [ "$line" == "string \"Play\"" ]; then
        xdotool windowfocus `xdotool search --name ".*mpv$"` && xdotool key space
    fi
    if [ "$line" == "string \"Pause\"" ]; then
        xdotool windowfocus `xdotool search --name ".*mpv$"` && xdotool key space
    fi
    if [ "$line" == "string \"Previous\"" ]; then
        xdotool windowfocus `xdotool search --name ".*mpv$"` && xdotool key Left
    fi
    if [ "$line" == "string \"Next\"" ]; then
        xdotool windowfocus `xdotool search --name ".*mpv$"` && xdotool key Right
    fi
done

