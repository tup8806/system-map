# Disk Usage Snapshot

Captured: Sun Mar 15 11:13:27 AM CDT 2026

## df -h
Filesystem          Size  Used Avail Use% Mounted on
udev                3.8G     0  3.8G   0% /dev
tmpfs               774M  1.5M  773M   1% /run
/dev/sda1           468G   66G  379G  15% /
tmpfs               3.8G     0  3.8G   0% /dev/shm
tmpfs               5.0M  8.0K  5.0M   1% /run/lock
tmpfs               774M  2.5M  772M   1% /run/user/1000
tup@192.168.4.76:/  457G  244G  190G  57% /mnt/myserver

## lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda      8:0    0 476.9G  0 disk 
├─sda1   8:1    0   476G  0 part /
├─sda2   8:2    0     1K  0 part 
└─sda5   8:5    0   975M  0 part [SWAP]
zram0  253:0    0   3.8G  0 disk [SWAP]
