#!/usr/bin/expect -f

set timeout -1
spawn ./scripts/keygen_and_transfer.sh

expect ":"
send "\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect "password:"
send "shared\r"
expect eof
