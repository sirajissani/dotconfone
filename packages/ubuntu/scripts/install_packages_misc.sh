#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install dos2unix
    sudo -E apt-get install git
fi
