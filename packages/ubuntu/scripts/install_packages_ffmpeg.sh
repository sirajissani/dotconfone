#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install -y ffmpeg mplayer mencoder mpv feh
fi
