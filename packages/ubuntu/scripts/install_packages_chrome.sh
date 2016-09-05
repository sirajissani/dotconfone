#!/bin/bash


wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google_dotconfone.list'


if [ $1 == "install" ]; then
    sudo -E apt-get install google-chrome-beta
fi
