#!/usr/bin/python

import os;
import sys;
import subprocess;
from dirsync import sync

source_path = '/home/lettucebowler/Documents/'
target_paths = {
    # '/home/lettucebowler/Documents2/'
    '192.168.122.26:/home/lettucebowler/Documents/',
    '192.168.122.75:/home/lettucebowler/Documents/',
    '192.168.122.82:/home/lettucebowler/Documents/'
}

for target in target_paths:
    # sync(source_path, target, 'sync')
    # sync(target, source_path, 'sync')
    cmd = 'dirsync' + " " + source_path + " " + target + " -s -c"
    process = subprocess.Popen(cmd, shell=True)
    try:
        process.wait()
    except KeyboardInterrupt:
        process.kill()
        sys.exit(1)
        break
