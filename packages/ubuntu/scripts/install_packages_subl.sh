#!/bin/bash

sudo -E add-apt-repository -y ppa:webupd8team/sublime-text-3

if [ $1 == "install" ]; then
    sudo -E apt-get install sublime-text-installer
fi
