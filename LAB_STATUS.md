# Lab Status Dashboard

Generated: Sun Mar 15 01:52:05 PM CDT 2026

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

---

## Output Freshness

<!-- FRESHNESS_TABLE_START -->
_Last updated: 2026-03-15 21:43:38 CDT by `stamp-outputs.sh` on `toughbook`_

| File | Last Generated | Host |
|------|----------------|------|
| `outputs/all-packages.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/cpu.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/device-inventory.md` | 2026-03-15 21:43:38 CDT | toughbook-- |
| `outputs/disk-usage.md` | 2026-03-15 21:43:38 CDT | toughbook-- |
| `outputs/docker-containers.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/docker-images.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/drift-report.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/filesystems.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/firewall-rules.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/flatpaks.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/bluetooth-controllers.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/dmidecode-baseboard.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/dmidecode-bios.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/dmidecode-memory.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/dmidecode-system.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/ip-address.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/ip-route.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/lsblk.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/lscpu.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/lspci.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/lsusb.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/nmcli-active-connections.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/nmcli-device-status.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/rfkill.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/hardware/uname.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/kernel-modules.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/lab-status.md` | 2026-03-15 21:43:38 CDT | toughbook-- |
| `outputs/listening-ports.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/manual-packages.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/memory.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/mounts.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/network-discovery.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/network-graph.dot` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/network-identity.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/network-map.dot` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/network-scan.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/network.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/new-devices.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/open-ports.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/os-release.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/running-services.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/all-packages.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/blkid.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/cpu.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/docker-containers.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/docker-images.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/docker-inspect.json` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/docker-networks.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/docker-volumes.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/filesystems.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/findmnt.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/firewall-rules.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/flatpaks.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/fstab.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/kernel-modules.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/listening-ports.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/manual-packages.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/memory.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/mounts.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/network.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/nfs-exports.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/open-ports.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/os-release.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/running-services.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/samba-config.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/services-system.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/services-user.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/snaps.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/storage.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/system-cron-files.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/systemd-timers.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/system-info.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/server/user-cron.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/services-system.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/services.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/services-user.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/snaps.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/apt-manual.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/docker-ps-a.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/dpkg-packages.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/npm-global.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/pip3-freeze.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/snap-list.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/systemd-running-services.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/software/systemd-unit-files.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/storage.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/system-cron-files.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/systemd-timers.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/system-index.json` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/system-info.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/system-summary.md` | 2026-03-15 21:43:38 CDT | toughbook-- |
| `outputs/toughbook-enabled-services.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/toughbook-global-npm.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/toughbook-manual-packages.txt` | 2026-03-15 21:43:38 CDT | toughbook |
| `outputs/user-cron.txt` | 2026-03-15 21:43:38 CDT | toughbook |
<!-- FRESHNESS_TABLE_END -->
