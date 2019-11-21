#!/usr/bin/python

destinations = {
    #remote sync destinations
    '192.168.122.75:/home/lettucebowler/Documents/',
    '192.168.122.82:/home/lettucebowler/Documents/',
    '192.168.122.26:/home/lettucebowler/Documents/'
}

src   = '/home/lettucebowler/Documents/'
rsync = 'rsync --times '

# ----------------------------------------------------------

import os;
import sys;
import subprocess;

destinations

# Only show progress when we're running in a terminal (and not cron):
if sys.stdout.isatty():
    rsync = rsync + '--progress '

for dir, dirs, files in os.walk(src):
    for filename in files:
        if filename.startswith(".") or filename.endswith(".part"):
            continue
        for dest in destinations:
            fullpath = os.path.join(dir, filename)
            print "Copying '" + filename + "' to folder '" + dest + "'"
            cmd = rsync + ' "' + fullpath + '" "' + dest + '/."'
            process = subprocess.Popen(cmd, shell=True)
            try:
                process.wait()
            # except KeyboardInterrupt:
            #     process.kill()
            #     sys.exit(1)
            break
