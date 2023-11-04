#!/bin/bash

intern=LVDS-0
extern=DP-3

if xrandr | grep "$extern connected"; then
    xrandr --output $extern --primary --dpi 144 --auto --output $intern --off
fi
