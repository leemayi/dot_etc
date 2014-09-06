#!/bin/bash

#install
#yum -y install git gcc gcc-c
#wget https://www.dropbox.com/s/vfzpxjk0wexu82b/jhprotominer-yvg1900-M7ff-linux64-core2.tgz

for ip in `cat available_ip`
do
    ./expect_login.sh ${ip}
    if [ $? == 0 ]
    then
        echo ${ip}
    fi
done


