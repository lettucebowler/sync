#!/usr/bin/python

src   = '/home/lettucebowler/Documents/'
dest  = '192.168.122.75:/home/lettucebowler/Documents/'
rsync = 'rsync --times '

# ----------------------------------------------------------

import os;
import sys;
import subprocess;

# Only show progress when we're running in a terminal (and not cron):
if sys.stdout.isatty():
    rsync = rsync + '--progress '

for dir, dirs, files in os.walk(src):
    for filename in files:
        if filename.startswith(".") or filename.endswith(".part"):
            continue
        fullpath = os.path.join(dir, filename)
        # for filter, destfolder in filters.iteritems():
        #     if filename.lower().find(filter) >= 0:
        fulldest = dest
        print "Copying '" + filename + "' to folder '" + "'"
        cmd = rsync + ' "' + fullpath + '" "' + fulldest + '/."'
        process = subprocess.Popen(cmd, shell=True)
        try:
            process.wait()
        except KeyboardInterrupt:
            process.kill()
            sys.exit(1)
            break
