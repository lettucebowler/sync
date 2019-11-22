
import os;
import sys;
import subprocess;

#sync files from local folder to server
cmd1 = "rsync --times -as --delete -e \" ssh -i ~/.ssh/Lettucebox\" '" + dest + "' '" + src + "'"
process1 = subprocess.Popen(cmd1, shell=True)
try:
    process1.wait()
except KeyboardInterrupt:
    process1.kill()
    sys.exit(1)

#sync files from server to local folder
cmd2 = "rsync --times -as --delete -e \" ssh -i ~/.ssh/Lettucebox\" '" + src + "' '" + dest + "'"
process2 = subprocess.Popen(cmd2, shell=True)22
try:
    process2.wait()
except KeyboardInterrupt:
    process2.kill()
    sys.exit(1)
