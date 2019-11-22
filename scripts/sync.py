
import os;
import sys;
import subprocess;

#sync files from local folder to server
cmd1 = "rsync --times -as -e \" ssh -i ~/.ssh/Lettucebox\" '" + src + "' '" + dest + "'"
process1 = subprocess.Popen(cmd1, shell=True)
try:
    process1.wait()
except KeyboardInterrupt:
    process1.kill()
    sys.exit(1)

#sync files from server to local folder
cmd2 = "rsync --times -as -e \" ssh -i ~/.ssh/Lettucebox\" '" + dest + "' '" + src + "'"
process2 = subprocess.Popen(cmd2, shell=True)
try:
    process2.wait()
except KeyboardInterrupt:
    process2.kill()
    sys.exit(1)

# cmd3 = "ls " + src " >> .snapshot"
# process3 = subprocess.Popen(cmd3, shell=True)
# try:
#     process2.wait()
# except KeyboardInterrupt:
#     process2.kill()
#     sy
