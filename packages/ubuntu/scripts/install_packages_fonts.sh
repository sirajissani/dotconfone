#!/bin/bash

function install_font()
{
    #$1 => Folder Name in /usr/local/share/fonts
    #$2 => Link to download

    font_dir=/usr/local/share/fonts/$1

    ls $font_dir
    if [ $? -ne 0 ]; then
        #Make directory
        sudo mkdir -p $font_dir

        #Download file
        wget $2 -O temp

        #Check if it is archive
        file temp |grep -E "archive|compressed"
        if [ $? -eq 0 ]; then
            #sudo unzip -o temp -d $font_dir
            sudo engrampa temp -e $font_dir --force
            rm -f temp
        fi

        #Check if it is TTF
        file temp |grep TrueType
        if [ $? -eq 0 ]; then
            sudo cp temp $font_dir/$1.ttf
            rm -f temp
        fi

        ls temp
        if [ $? -eq 0 ]; then
             echo "Unknown file, removing it"
             file temp
             rm -f temp
        fi

    fi
}

if [ $1 == "install" ]; then
    sudo -E apt-get install -y fonts-deva*

    install_font mononoki "https://github.com/madmalik/mononoki/releases/download/1.2/mononoki.zip"
    install_font Monaco "https://raw.githubusercontent.com/todylu/monaco.ttf/master/monaco.ttf"

    fc-cache -fv
fi

