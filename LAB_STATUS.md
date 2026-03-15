# Lab Status Dashboard

Generated: Sun Mar 15 01:49:08 AM CDT 2026

## Server
- Hostname: tup
- IP: 192.168.4.76

## Key Services
| Service | URL | Purpose |
|--------|-----|---------|
| Jellyfin | http://192.168.4.76:8096 | Media server |
| Portainer | http://192.168.4.76:9000 | Docker management |
| Uptime Kuma | http://192.168.4.76:3001 | Monitoring dashboard |
| Tdarr | http://192.168.4.76:8265 | Media transcoding |

## System Snapshot

Recent system summary:

# System Summary

Generated: Sun Mar 15 01:23:22 AM CDT 2026

## Hostname
toughbook

## System Uptime
 01:23:22 up  8:40,  1 user,  load average: 0.54, 0.64, 0.69

## Disk Usage
Filesystem          Size  Used Avail Use% Mounted on
udev                3.8G     0  3.8G   0% /dev
tmpfs               774M  1.5M  773M   1% /run
/dev/sda1           468G   66G  379G  15% /
tmpfs               3.8G     0  3.8G   0% /dev/shm
tmpfs               5.0M  8.0K  5.0M   1% /run/lock
tmpfs               774M  2.5M  772M   1% /run/user/1000
tup@192.168.4.76:/  457G  244G  190G  57% /mnt/myserver

## Memory Usage
               total        used        free      shared  buff/cache   available
Mem:           7.6Gi       3.9Gi       1.3Gi        78Mi       2.7Gi       3.7Gi
Swap:          8.7Gi          0B       8.7Gi

## Network Interfaces
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s25          DOWN           
wlp10s0          UP             192.168.4.82/22 fde2:5368:55a8:1:db8f:d7b6:5ac1:7d76/64 fde2:5368:55a8:1:227:10ff:fe37:78e8/64 fe80::227:10ff:fe37:78e8/64 
docker0          DOWN           172.17.0.1/16 

## Docker Containers
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

## Listening Ports
State  Recv-Q Send-Q Local Address:Port  Peer Address:PortProcess                                   
LISTEN 0      511        127.0.0.1:18792      0.0.0.0:*    users:(("openclaw-gatewa",pid=857,fd=29))
LISTEN 0      511        127.0.0.1:18791      0.0.0.0:*    users:(("openclaw-gatewa",pid=857,fd=28))
LISTEN 0      511        127.0.0.1:18789      0.0.0.0:*    users:(("openclaw-gatewa",pid=857,fd=22))
LISTEN 0      4096       127.0.0.1:9050       0.0.0.0:*                                             
LISTEN 0      128          0.0.0.0:22         0.0.0.0:*                                             
LISTEN 0      511            [::1]:18789         [::]:*    users:(("openclaw-gatewa",pid=857,fd=23))
LISTEN 0      128             [::]:22            [::]:*                                             

## Top CPU Processes
    PID COMMAND         %CPU %MEM
   1488 firefox-esr     21.0  9.2
   1646 Isolated Web Co 16.0 13.1
   1708 Isolated Web Co  7.5  2.6
    834 Xorg             3.3  1.4
  38451 xfce4-terminal   1.9  0.6
   3232 Isolated Web Co  1.7  4.6
   6433 Isolated Web Co  0.8  4.3
    857 openclaw-gatewa  0.3  5.3
   1129 xfce4-panel      0.3  0.6


## Documentation Map
- Inventory: INVENTORY.md
- Hardware docs: notes/hardware/
- Storage layout: notes/storage-layout.md
- Network topology: notes/network-topology.md
- Server services: notes/server-services.md
- Server applications: notes/server-applications.md

