#!/bin/bash
if [[ "$1" == "-h" ]]
then
    echo "usage: cmd remote_filename local_filename"
else
    wget -q "ftp://yf-cm-bdbs42.yf01/home/work/bs/$1" -O $2
fi

