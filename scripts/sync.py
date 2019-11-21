#!/usr/bin/python

src   = '~/Documents/'
dest = '192.168.122.166:/home/shared/Documents/'

# ----------------------------------------------------------

import os;
import sys;
import subprocess;

#sync files from local folder to server
cmd1 = "rsync --times -as -e \" ssh -i ~/.ssh/id_rsa\" '" + src + "' '" + dest + "'"
process1 = subprocess.Popen(cmd1, shell=True)

try:
    process1.wait()
except KeyboardInterrupt:
    process1.kill()
    sys.exit(1)

#sync files from server to local folder
cmd2 = "rsync --times -as -e \" ssh -i ~/.ssh/id_rsa\" '" + dest + "' '" + src + "'"
process2 = subprocess.Popen(cmd2, shell=True)

try:
    process2.wait()
except KeyboardInterrupt:
    process2.kill()
    sys.exit(1)