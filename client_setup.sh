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
mv $Server.py /home/$USER/.Lettucebox/$Server.py


sudo echo "#run every minute" >> /etc/cron.d/$Server.cron
sudo echo "*/5 * * * *   $USER  python /home/$USER/.Lettucebox/$Server.py" >> /etc/cron.d/$Server.cron
sudo echo "\n" >> /etc/cron.d/$Server.cron
sudo echo "# run script after system (re)boot" >> /etc/cron.d/$Server.cron
sudo echo "@reboot       $USER  python /path/to/script.py" >> /etc/cron.d/$Server.cron

# Setup folder to sync
mkdir /home/$USER/Lettucebox

#install dependencies

./scripts/autofill_keygen.sh $Server
ssh shared@$Server mkdir /home/shared/Lettucebox/$USER
