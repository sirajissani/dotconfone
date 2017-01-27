#!/bin/bash

sudo dpkg --add-architecture i386

if [ $1 == "install" ]; then
    sudo -E apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
    sudo -E apt-get install -y libncurses5
    sudo -E apt-get install -y dos2unix
    sudo -E apt-get install -y tofrodos
    sudo -E apt-get install -y uncrustify
    sudo -E apt-get install -y git
    sudo -E apt-get install -y synaptic
    sudo -E apt-get install -y x11vnc
    sudo -E apt-get install -y vim vim-gnome vim-addon-manager
    sudo -E apt-get install -y exuberant-ctags
    sudo -E apt-get install -y cscope
    sudo -E apt-get install -y curl corkscrew
    sudo -E apt-get install -y tree htop tilda screen terminator
    sudo -E apt-get install -y ssh sshfs
fi
