#!/bin/bash

sudo add-apt-repository -y ppa:embrosyn/cinnamon

if [ $1 == "install" ]; then
    sudo -E apt-get install -y cinnamon-desktop-environment
    sudo -E apt-get install -y i3 i3-wm
fi

