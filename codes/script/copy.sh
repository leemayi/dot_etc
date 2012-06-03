#!/bin/bash

while read file
do
    dir="/home/huangjian/share/bs/tmp/app/ecom/nova/se/se-bs/"`dirname $file`
    echo $dir
    filename="$dir/"`basename $file`
    echo $filename
    cp $file $filename
done < 1
    
