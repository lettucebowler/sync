#!/usr/bin/python

# destinations = {
#     #remote sync destinations
#     '192.168.122.75:/home/lettucebowler/Documents/',
#     '192.168.122.82:/home/lettucebowler/Documents/',
#     '192.168.122.26:/home/lettucebowler/Documents/'
# }

src   = '/home/lettucebowler/Documents/'
dest = '192.168.122.166:/home/lettucebowler/Documents/'

# ----------------------------------------------------------

import os;
import sys;
import subprocess;

#sync files from local folder to server
cmd1 = "rsync --times -avs -i /home/lettucebowler/.ssh/id_rsa.pub '" + src + "' '" + dest + "'"
process1 = subprocess.Popen(cmd1, shell=True)

try:
    process1.wait()
except KeyboardInterrupt:
    process1.kill()
    sys.exit(1)

#sync files from server to local folder
cmd2 = "rsync --times -avs -i /home/lettucebowler/.ssh/id_rsa.pub '" + dest + "' '" + src + "'"
process2 = subprocess.Popen(cmd2, shell=True)

try:
    process2.wait()
except KeyboardInterrupt:
    process2.kill()
    sys.exit(1)
