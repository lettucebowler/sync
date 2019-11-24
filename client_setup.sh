#!/bin/bash

sudo apt install python
sudo apt install python-pip
pip install pyinstaller
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
    /home/$USER/.Lettucebox/pebble.lettucebowler.net.py
    sleep 5s
done" >> /home/$USER/.Lettucebox/sync.sh
sudo chmod 0755 /home/$USER/.Lettucebox/sync.sh
sudo chown root:root /home/$USER/.Lettucebox/sync.sh
# sudo update-rc.d /home/$USER/.Lettucebox/sync.sh&
echo "
/home/$USER/.Lettucebox/sync.sh&
disown" >> ~/.bashrc


# Setup folder to sync
mkdir /home/$USER/Lettucebox

#install dependencies

./scripts/autofill_keygen.sh $USER $Server
ssh shared@$Server mkdir /home/shared/Lettucebox/$USER

rsync --times -as -e " ssh -i ~/.ssh/Lettucebox" shared@$Server:/home/shared/Lettucebox/$USER/ /home/$USER/Lettucebox/

echo "#!/bin/bash
ssh shared@$Server rm /home/shared/Lettucebox/$USER/\$1
rm -rf /home/$USER/Lettucebox/\$s1" >> /home/$USER/Lettucebox/del.sh
chmod 0700 /home/$USER/Lettucebox/del.sh

echo "#!bin/bash
ssh shared@Server touch /home/shared/Lettucebox/$USER/\$1
touch /home/$USER/Lettucebox/$1" >> /home/$USER/Lettucebox/make.sh
chmod 0700 /home/$USER/Lettucebox/make.sh


/home/$USER/.Lettucebox/sync.sh&
disown


