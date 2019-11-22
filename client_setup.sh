#!/bin/bash

# Generate Python script to send out files to sync server.
echo "Server ip/hostname : "
read Server
echo "#!/usr/bin/python" >> $Server.py
echo "dest = 'shared@$Server:/home/shared/$USER/Lettucebox/'" >> $Server.py
echo "src = '/home/$USER/Lettucebox/'" >> $Server.py
cat scripts/sync.py >> $Server.py
chmod 0777 $Server.py
mkdir /home/$USER/.Lettucebox
mv $Server.py /home/$USER/.Lettucebox/$Server.py

# Setup folder to sync
mkdir /home/$USER/Lettucebox

#install dependencies
# sudo apt install python
# sudo apt install python-pip
# pip install pyinstaller
# sudo apt install cron
# sudo apt install expect
./scripts/autofill_keygen.sh $Server

# ssh shared@$Server mkdir -p /home/shared/Lettucebox/$USER
