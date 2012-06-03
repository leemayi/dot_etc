#!/bin/sh
ssh-keygen -t rsa
while read name
do
echo $name
sh trust.sh $name
#ssh $name 'cd /home/work/ufs-mola-2-full/chunkserver; killall sup.mola.chunkserver; sleep 1;' &
done < list
