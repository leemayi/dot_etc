#!/bin/bash
BACKDIR="/home/huangjian/backup_huangjian"
if [ ! -d $BACKDIR ] 
then 
    mkdir $BACKDIR
fi


cd $BACKDIR
if [ $? != 0 ] 
then
    echo "ERROR: backup failed"
    exit
fi
 
if [ -f backup_latest.tar.gz ] 
then
    mv backup_latest.tar.gz backup_last.tar.gz
fi
tar -zcvf backup_latest.tar.gz ~/tools ~/etc_huangjian 

if [ $? != 0 ] 
then
    echo "ERROR: backup failed"
else
    echo "NOTICE: backup suceed"
fi
