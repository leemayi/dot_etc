#!/usr/bin/expect
set timeout 60
spawn ssh -D 7070 -g user@ip
expect {
"password:" {
send "pass\r"
}
}
interact {
timeout 600 { send " "}
}
