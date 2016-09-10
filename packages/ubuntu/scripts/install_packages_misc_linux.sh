#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install -y dtrx
    sudo -E apt-get install -y u-boot-tools
fi
