#!/bin/sh
#Here's a little one liner that'll do the trick (for passwordless auth) after you've done the ssh-keygen -d:
if [ $# -lt 1 ]; then 
    echo "usage: $0 <username@host>"
    echo " i.e.: $0 murj@huimin.baidu.com"
    echo    
    exit 1  
fi
target="$1"
port=$2
ssh -p $port "$target" 'test -d .ssh || mkdir -m 0700 .ssh ; cat >>.ssh/authorized_keys && chmod 0600 .ssh/*' < ~/.ssh/id_rsa.pub
exit 0
