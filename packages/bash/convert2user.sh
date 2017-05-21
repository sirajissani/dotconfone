#!/bin/bash

function print_usage() {
    echo ""
    echo "USAGE:  $1 path/to/dir username"
    echo ""
}

if [ -z "$1" ]; then
    echo ""
    echo "ERROR: Expected 2 arguments"
    print_usage $0
    exit -1
fi

if [ -z "$2" ]; then
    echo ""
    echo "ERROR: Expected 2 arguments"
    print_usage $0
    exit -1
fi


if [ ! `whoami` ==  "root" ]; then
    echo ""
    echo "ERROR: Run me as root"
    exit -1
fi

dirperm=775
filperm=664

find $1 -type d -exec chmod $dirperm {} \;
find $1 -type f -exec chmod $filperm {} \;
find $1 -type f -name "*.sh" -exec chmod $dirperm {} \;

chown $2 -R $1
chgrp $2 -R $1

exit 0
