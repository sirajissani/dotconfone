#!/bin/bash

#No-arg => setup repo
#No-arg => run apt-get
function run_install_scripts() {
    #Misc
    ./scripts/install_packages_misc.sh $1

    #Google Chrome
    ./scripts/install_packages_chrome.sh $1

    #Sublime
    ./scripts/install_packages_subl.sh $1

    #GCC
    ./scripts/install_packages_gcc.sh $1

    #Mono
    ./scripts/install_packages_gcc.sh $1

    #ffmpeg and friends
    ./scripts/install_packages_ffmpeg.sh $1

    #Misc linux tools
    ./scripts/install_packages_misc_linux.sh $1

    #Fonts
    ./scripts/install_packages_fonts.sh $1

    #Cinnamon and I3
    #./scripts/install_packages_desktop.sh $1

    #Docker
    #./scripts/install_packages_docker.sh $1
}

#Get sudo
sudo touch install_packages.test
sudo rm install_packages.test

chmod a+x  */*.sh
run_install_scripts setup
sudo apt-get update
run_install_scripts install




