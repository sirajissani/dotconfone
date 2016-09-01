#!/bin/bash

sudo add-apt-repository -y ppa:mc3man/mpv-tests
sudo add-apt-repository -y ppa:jonathonf/ffmpeg-3

if [ $1 == "install" ]; then
    sudo -E apt-get install -y ffmpeg mplayer mencoder mpv feh

    sudo apt-get remove -y youtube-dl
    youtube-dl -U
    if [ $? -ne 0 ]; then
        sudo -E curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
    fi
fi
