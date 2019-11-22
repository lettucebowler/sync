#1/bin/bash

ssh-keygen -t rsa
ssh-copy-id -i /home/$1/.ssh/Lettucebox.pub shared@$2
