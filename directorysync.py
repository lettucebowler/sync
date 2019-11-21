#!/usr/bin/python
from dirsync import sync

source_path = '/home/lettucebowler/Documents'
target_paths = {
    '192.168.122.26:/home/lettucebowler/Documents/',
    '192.168.122.75:/home/lettucebowler/Documents/',
    '192.168.122.82:/home/lettucebowler/Documents/'
}

for target in target_paths:
    sync(source_path, target, 'sync')
    sync(target, source_path, 'sync')
