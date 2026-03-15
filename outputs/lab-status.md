# Home Lab Status

Generated: Sun Mar 15 01:20:09 PM CDT 2026

## Server Services
id           container_name  image                             status   ports                                              restart_policy
tdarr        tdarr           ghcr.io/haveagitgat/tdarr:latest  running  8265/tcp -> 0.0.0.0:8265;8266/tcp -> 0.0.0.0:8266  unless-stopped
jellyfin     jellyfin        jellyfin/jellyfin:latest          running  8096/tcp -> 0.0.0.0:8096                           unless-stopped
uptime_kuma  uptime-kuma     louislam/uptime-kuma:1            running  3001/tcp -> 0.0.0.0:3001                           unless-stopped
portainer    portainer       portainer/portainer-ce:latest     running  9000/tcp -> 0.0.0.0:9000                           always

## Discovered Devices
Interface: wlp10s0, type: EN10MB, MAC: 00:27:10:37:78:e8, IPv4: 192.168.4.82
192.168.4.1	44:ac:85:41:da:f2	(Unknown)
192.168.4.23	64:e0:03:d2:8f:c8	Hui Zhou Gaoshengda Technology Co.,LTD
192.168.4.25	cc:6b:1e:b8:b7:a3	CLOUD NETWORK TECHNOLOGY SINGAPORE PTE. LTD.
192.168.4.75	00:d2:b1:1a:dd:31	TPV Display Technology (Xiamen) Co.,Ltd.
192.168.4.59	82:83:57:0f:3d:da	(Unknown: locally administered)
192.168.4.77	44:ac:85:22:ef:f2	(Unknown)
Nmap scan report for 192.168.4.1
Nmap scan report for 192.168.4.23
Nmap scan report for 192.168.4.25
Nmap scan report for 192.168.4.59
Nmap scan report for 192.168.4.75
Nmap scan report for 192.168.4.76
Nmap scan report for 192.168.4.77
Nmap scan report for 192.168.4.82
192.168.5.241 dev wlp10s0 FAILED 
192.168.7.149 dev wlp10s0 FAILED 
192.168.4.200 dev wlp10s0 FAILED 
192.168.5.90 dev wlp10s0 FAILED 
192.168.5.195 dev wlp10s0 FAILED 

## Device Inventory
# Network Device Inventory

Generated: Sun Mar 15 01:14:20 PM CDT 2026

## Known Devices

| IP | Name | Notes |
|----|------|------|
| 192.168.4.1 | Eero Router | Primary gateway |
| 192.168.4.77 | Eero Mesh Node | Secondary WiFi node |
| 192.168.4.76 | Optiplex Server | Home server (tup) |
| 192.168.4.82 | Toughbook | Admin workstation |
| 192.168.4.23 | Roku TV | AirPlay enabled |
| 192.168.4.59 | Pixel 10 | Temporary FTP sharing when transferring media |

## Devices Seen In Last Scan

- 192.168.4.1
- 192.168.4.23
- 192.168.4.25

## Disk Usage Snapshot
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

## Detailed Files
- outputs/network-identity.txt
- outputs/network-discovery.txt
- outputs/device-inventory.md
- configs/server-services.csv

