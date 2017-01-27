#!/bin/bash

if [ $1 == "install" ]; then
    sudo -E apt-get install -y openjdk-8-jdk
    sudo -E apt-get install -y openjdk-8-jre
    sudo -E apt-get install -y icedtea-8-plugin
fi
