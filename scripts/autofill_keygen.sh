#!/usr/bin/expect -f

set timeout 0.5
spawn ./scripts/keygen_and_transfer.sh
expect "[Y/n]"
send "y\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect "password:"
send "shared\r"
expect eof
