#!/bin/bash

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"

if [ $1 == "install" ]; then
    sudo -E apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
    sudo -E apt-get install -y apt-transport-https ca-certificates
    sudo -E apt-get install -y docker-engine
fi
