#!/usr/bin/expect -f
spawn ./scripts/user_create.sh
expect ":"
send "shared\r"
expect "password:"
send "shared\r"
expect "]:"
send "\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect ":"
send "\r"
expect "] "
send "y\r"
send "\n"
