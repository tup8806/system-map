# System Map Context

Updated: Thu Mar 12 12:27:40 PM CDT 2026

## Latest Commit
4cdcda2 Server snapshot 2026-03-12 00:20

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
Filesystem                         Size  Used Avail Use% Mounted on
udev                               3.8G     0  3.8G   0% /dev
tmpfs                              774M  1.6M  773M   1% /run
/dev/sda1                          468G   24G  420G   6% /
tmpfs                              3.8G  216K  3.8G   1% /dev/shm
tmpfs                              5.0M  8.0K  5.0M   1% /run/lock
tmpfs                              774M  2.5M  772M   1% /run/user/1000
tup@192.168.4.76:/                 457G  215G  219G  50% /mnt/myserver
qbittorrent-5.1.4_x86_64.AppImage   93M   93M     0 100% /tmp/.mount_qbittoEPlkAA

## Local Services
### Running services
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

## Server Docker Containers
CONTAINER ID   IMAGE         COMMAND          CREATED      STATUS                    PORTS     NAMES
980722499c61   geti2p/i2p    "/startapp.sh"   8 days ago   Exited (137) 8 days ago             i2p
8cbc02dde049   hello-world   "/hello"         8 days ago   Exited (0) 8 days ago               sharp_wilson

## Server Running Services
  UNIT                      LOAD   ACTIVE SUB     DESCRIPTION
  bluetooth.service         loaded active running Bluetooth service
  colord.service            loaded active running Manage, Install and Generate Color Profiles
  containerd.service        loaded active running containerd container runtime
  cron.service              loaded active running Regular background program processing daemon
  dbus.service              loaded active running D-Bus System Message Bus
  docker.service            loaded active running Docker Application Container Engine
  getty@tty1.service        loaded active running Getty on tty1
  keyd.service              loaded active running key remapping daemon
  lightdm.service           loaded active running Light Display Manager
  NetworkManager.service    loaded active running Network Manager
  polkit.service            loaded active running Authorization Manager
  rtkit-daemon.service      loaded active running RealtimeKit Scheduling Policy Service
  smartmontools.service     loaded active running Self Monitoring and Reporting Technology (SMART) Daemon
  ssh.service               loaded active running OpenBSD Secure Shell server
  systemd-hostnamed.service loaded active running Hostname Service
  systemd-journald.service  loaded active running Journal Service
  systemd-logind.service    loaded active running User Login Management
  systemd-timesyncd.service loaded active running Network Time Synchronization
  systemd-udevd.service     loaded active running Rule-based Manager for Device Events and Files
  tor@default.service       loaded active running Anonymizing overlay network for TCP
  udisks2.service           loaded active running Disk Manager
  upower.service            loaded active running Daemon for power management
  user@1000.service         loaded active running User Manager for UID 1000
  wpa_supplicant.service    loaded active running WPA supplicant

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.
24 loaded units listed.

## Server Storage
NAME     SIZE FSTYPE FSAVAIL FSUSE% MOUNTPOINT MODEL
sda    476.9G                                  TEAM T253512GB
├─sda1   476G ext4    419.7G     5% /          
├─sda2     1K                                  
└─sda5   975M swap                  [SWAP]     
zram0    3.8G                       [SWAP]     

## Hardware Documentation
See detailed hardware notes in:
- notes/hardware/toughbook.md
- notes/hardware/secondary-compute.md
- notes/hardware/embedded-radio.md
- notes/hardware/overview.md
