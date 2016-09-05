#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install -y dos2unix
    sudo -E apt-get install -y git
    sudo -E apt-get install -y synaptic
    sudo -E apt-get install -y x11vnc
    sudo -E apt-get install -y vim vim-gnome vim-addon-manager
    sudo -E apt-get install -y exuberant-ctags
    sudo -E apt-get install -y cscope-el
fi
