#!/bin/bash

sudo apt install python
sudo apt install python-pip
pip install pyinstaller
sudo apt install cron
sudo apt install expect

# Generate Python script to send out files to sync server.
echo "Server ip/hostname : "
read Server
echo "#!/usr/bin/python" >> $Server.py
echo "dest = 'shared@$Server:/home/shared/Lettucebox/$USER/'" >> $Server.py
echo "src = '/home/$USER/Lettucebox/'" >> $Server.py
cat scripts/sync.py >> $Server.py
chmod 0777 $Server.py
mkdir /home/$USER/.Lettucebox
mv $Server.py /home/$USER/.Lettucebox/$Server.py\

echo "
while true
do
    ./pebble.lettucebowler.net.py
    sleep 1m
done" >> /home/$USER/.Lettucebox/sync.sh
sudo chmod 0755 /home/$USER/.Lettucebox/sync.sh
sudo update-rc.d /home/$USER/.Lettucebox/sync.sh& default

/home/$USER/.Lettucebox/sync.sh&
disown

# Setup folder to sync
mkdir /home/$USER/Lettucebox

#install dependencies

./scripts/autofill_keygen.sh $USER $Server
ssh shared@$Server mkdir /home/shared/Lettucebox/$USER
