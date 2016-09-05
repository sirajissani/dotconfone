#!/bin/bash

#No-arg => setup repo
#No-arg => run apt-get
function run_install_scripts() {
    #Google Chrome
    ./scripts/install_packages_chrome.sh $1

    #Sublime
    ./scripts/install_packages_subl.sh $1

    #GCC
    ./scripts/install_packages_gcc.sh $1

    #Mono
    ./scripts/install_packages_gcc.sh $1

    #Misc
    ./scripts/install_packages_misc.sh $1
}

#Get sudo
sudo touch install_packages.test
sudo rm install_packages.test

run_install_scripts setup
sudo apt-get update
run_install_scripts install




