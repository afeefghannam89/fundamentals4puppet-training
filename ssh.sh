#!/usr/bin/expect -f
spawn ssh-copy-id -i /home/training/.ssh/id_rsa git@puppet.localdomain
set timeout 30
expect "*?yes*"
send --   "yes\r"
sleep 5
expect "*?password*"
send -- "netways\r"
expect eof
