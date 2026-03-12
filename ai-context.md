# System Map Context

Updated: Thu Mar 12 12:16:48 AM CDT 2026

## Latest Commit
d478cd7 Server snapshot 2026-03-11 21:08

## Network
### Network
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s25          DOWN           
wlp10s0          UP             192.168.4.82/22 fde2:5368:55a8:1:8758:b324:15cb:636d/64 fde2:5368:55a8:1:b2c2:8a8a:78a3:9db8/64 fde2:5368:55a8:1:227:10ff:fe37:78e8/64 fe80::227:10ff:fe37:78e8/64 
docker0          DOWN           172.17.0.1/16 

default via 192.168.4.1 dev wlp10s0 proto dhcp src 192.168.4.82 metric 600 
169.254.0.0/16 dev wlp10s0 scope link metric 1000 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.4.0/22 dev wlp10s0 proto kernel scope link src 192.168.4.82 metric 600 

## Storage
### Storage
Filesystem          Size  Used Avail Use% Mounted on
udev                3.8G     0  3.8G   0% /dev
tmpfs               774M  1.6M  773M   1% /run
/dev/sda1           468G   24G  420G   6% /
tmpfs               3.8G  216K  3.8G   1% /dev/shm
tmpfs               5.0M  8.0K  5.0M   1% /run/lock
tmpfs               774M  2.5M  772M   1% /run/user/1000
tup@192.168.4.76:/  457G  215G  219G  50% /mnt/myserver

## Services
### Running services
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

