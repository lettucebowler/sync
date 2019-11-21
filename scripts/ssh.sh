#1/bin/bash

ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub 192.168.122.166
