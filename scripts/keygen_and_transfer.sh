#1/bin/bash

ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/Lettucebox.pub $1
