#!/bin/bash

(($(lsb_release -r | awk -F" " '{print $2}' | awk -F"." '{ print $1 }') >= 16))
if [ $? -eq 0 ]; then
    # On Ubuntu systems >= 16.04
    /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
    sudo -E dpkg -i ./keyring.deb
    sudo rm keyring.deb
    sudo -E sh -c "echo deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe > /etc/apt/sources.list.d/sur5r-i3.list"
fi

if [ $1 == "install" ]; then
    # On Ubuntu systems >= 16.04
    /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
    sudo -E apt install ./keyring.deb
    sudo -E echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
    sudo -E apt update
    sudo -E apt-get install -y i3 i3-wm
    sudo -E apt-get install -y pavucontrol
    sudo -E apt-get install -y xbacklight
    sudo -E apt-get install -y xautolock
    sudo -E apt-get install -y rofi
    sudo -H pip install i3-py
fi

