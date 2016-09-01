#!/bin/bash

sudo dpkg --add-architecture i386
sudo -E add-apt-repository -y ppa:wine/wine-builds

if [ $1 == "install" ]; then
    sudo -E apt-get install -y --install-recommends winehq-devel
    wget https://notepad-plus-plus.org/repository/7.x/7.3.1/npp.7.3.1.Installer.exe
    wine npp.7.3.1.Installer.exe
    rm npp.7.3.1.Installer.exe
fi
