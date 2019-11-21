#1/bin/bash

ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub shared@pebble.lettucebowler.net
