#!/bin/bash


if [ $1 == "install" ]; then
    sudo -E apt-get install -y fonts-deva*
	wget https://github.com/madmalik/mononoki/releases/download/1.2/mononoki.zip
	sudo mkdir -p /usr/local/share/fonts/mononoki/
	sudo unzip -o mononoki.zip -d /usr/local/share/fonts/mononoki/
	fc-cache -fv
	rm mononoki.zip*
fi

