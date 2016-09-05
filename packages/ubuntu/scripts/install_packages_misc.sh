#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install dos2unix
    sudo -E apt-get install git
    sudo -E apt-get install synaptic
    sudo -E apt-get install x11vnc
    sudo -E apt-get install vim vim-gnome vim-addon-manager
    sudo -E apt-get install exuberant-ctags
    sudo -E apt-get install cscope-el
fi
