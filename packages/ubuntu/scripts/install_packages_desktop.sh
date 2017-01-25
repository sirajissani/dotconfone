#!/bin/bash


if [ $1 == "install" ]; then
	sudo -E apt-get install -y cinnamon-desktop-environment
	sudo -E apt-get install -y i3 i3-wm
fi

