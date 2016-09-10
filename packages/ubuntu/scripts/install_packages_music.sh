#!/bin/bash

sudo add-apt-repository ppa:anonbeat/guayadeque

if [ $1 == "install" ]; then
    sudo -E apt-get install -y mpd mpc ncmpcpp mpdscribble
    sudo -E apt-get install -y guayadeque
fi-y
