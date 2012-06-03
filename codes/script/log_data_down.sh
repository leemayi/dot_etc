#!/bin/bash
if [[ "$1" == "-h" ]]
then
    echo "usage: cmd remote_filename local_filename"
else
    wget "http://logdata.baidu.com/?m=Data&a=GetData&token=ecom_cpro_2ig4tj1tsbai41tunq5rvi&product=ecom_cpro&date=$2 00:00:00&item=$1" -q  -O "$1_$2"
fi
 
