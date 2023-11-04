#!/bin/bash

# 1. Source user preference file
#       Use a config file to store preferences from users which
#       can be generated with a text file or using a ncurses or 
#       other such (g)ui package
#
# 2. Run each package listed in the preference file
#       The preference file holds an array variable which lists
#       the packages that the user comments/uncomments in the 
#       preference file. This array is looped over in this script
#       and is installed one by one.

PREFFILE="pref.conf"

function loop_script_array() {
    for key in $1
    do
        file=`echo "ubuntu/scripts/install_packages_"$key".sh"`
        $file setup
        $file install
    done
}

function run_install_scripts() {
    echo "Reading preferences from $1"
    . $1
    if [ -z "$pacarr" ]; then
        echo "$1 does not populate a list of packages"
        echo "pacarr = "$pacarr
        exit
    fi
    echo ""
    echo $pacarr
    echo ""
    while true; do
        read -p "Do you wish to continue with above packages? [y/n] " yn
        echo ""
        case $yn in
            [Yy]* ) loop_script_array $pacarr; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}


if [ -z "$1" ]; then
    if [ -f $PREFFILE ]; then
        run_install_scripts $PREFFILE

    else
        echo "First time config needed"
        ./setdefaults.sh
        while true; do
            read -p "Do you wish to continue with defaults? [y/n] " yn
            echo ""
            case $yn in
                [Yy]* ) ./deploy.sh $PREFFILE; break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
else
    run_install_scripts $1
fi

# . ./pref.conf

