#!/usr/bin/expect -f

set timeout -1

spawn ./scripts/keygen_and_transfer.sh [lindex $argv 0]

expect ":"
send "/home/lettucebowler/.ssh/Lettucebox\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect ":"
send "shared\r"
expect eof
