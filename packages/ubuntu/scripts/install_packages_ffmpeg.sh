#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install -y ffmpeg mplayer mencoder mpv feh

    sudo apt-get remove -y youtube-dl
    youtube-dl -U
    if [ $? -ne 0 ]; then
    	sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    	sudo chmod a+rx /usr/local/bin/youtube-dl
    fi
fi
