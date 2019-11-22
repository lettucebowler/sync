#!/usr/bin/expect -f

set timeout -1

set username [lindex $argv 0];
set host [lindex $argv 1];

spawn ./scripts/keygen_and_transfer.sh $username $host

expect ":"
send "/home/$username/.ssh/Lettucebox\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect "'s password:"
send "shared\r"
expect eof
