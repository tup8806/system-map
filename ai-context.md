# System Map Context

Updated: Mon Mar 16 03:00:55 AM CDT 2026

## Latest Commit
44e3c50 Server services snapshot 2026-03-16 03:00

## Core Documentation
- README.md
- AI_README.md
- INVENTORY.md
- notes/lab-architecture.md
- notes/machine-roles.md
- notes/network-topology.md
- notes/server-overview.md
- notes/server-purpose.md
- notes/server-services.md
- notes/storage-layout.md
- notes/toughbook-purpose.md
- notes/hardware/toughbook.md
- notes/hardware/server.md

## network.txt
# generated: 2026-03-15 21:43:38 CDT | host: toughbook

### Network
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s25          DOWN           
wlp10s0          UP             192.168.4.82/22 fde2:5368:55a8:1:4178:d948:ed89:8c46/64 fde2:5368:55a8:1:db8f:d7b6:5ac1:7d76/64 fde2:5368:55a8:1:227:10ff:fe37:78e8/64 fe80::227:10ff:fe37:78e8/64 
docker0          DOWN           172.17.0.1/16 

default via 192.168.4.1 dev wlp10s0 proto dhcp src 192.168.4.82 metric 600 
169.254.0.0/16 dev wlp10s0 scope link metric 1000 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.4.0/22 dev wlp10s0 proto kernel scope link src 192.168.4.82 metric 600 

## hardware.txt
# generated: 2026-03-15 21:43:38 CDT | host: toughbook

### Hardware
Architecture:                            x86_64
CPU op-mode(s):                          32-bit, 64-bit
Address sizes:                           36 bits physical, 48 bits virtual
Byte Order:                              Little Endian
CPU(s):                                  4
On-line CPU(s) list:                     0-3
Vendor ID:                               GenuineIntel
Model name:                              Intel(R) Core(TM) i5 CPU       M 520  @ 2.40GHz
CPU family:                              6
Model:                                   37
Thread(s) per core:                      2
Core(s) per socket:                      2
Socket(s):                               1
Stepping:                                2
Frequency boost:                         enabled
<<<<<<< Updated upstream
CPU(s) scaling MHz:                      65%
=======
CPU(s) scaling MHz:                      102%
>>>>>>> Stashed changes
CPU max MHz:                             2400.0000
CPU min MHz:                             1199.0000
BogoMIPS:                                4787.88
Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 popcnt aes lahf_lm pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid dtherm ida arat flush_l1d
Virtualization:                          VT-x
L1d cache:                               64 KiB (2 instances)
L1i cache:                               64 KiB (2 instances)
L2 cache:                                512 KiB (2 instances)
L3 cache:                                3 MiB (1 instance)
NUMA node(s):                            1
NUMA node0 CPU(s):                       0-3
Vulnerability Gather data sampling:      Not affected
Vulnerability Indirect target selection: Not affected
Vulnerability Itlb multihit:             KVM: Mitigation: VMX disabled
Vulnerability L1tf:                      Mitigation; PTE Inversion; VMX conditional cache flushes, SMT vulnerable
Vulnerability Mds:                       Vulnerable: Clear CPU buffers attempted, no microcode; SMT vulnerable
Vulnerability Meltdown:                  Mitigation; PTI
Vulnerability Mmio stale data:           Unknown: No mitigations
Vulnerability Reg file data sampling:    Not affected
Vulnerability Retbleed:                  Not affected
Vulnerability Spec rstack overflow:      Not affected
Vulnerability Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:                Mitigation; Retpolines; IBPB conditional; IBRS_FW; STIBP conditional; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
Vulnerability Srbds:                     Not affected
Vulnerability Tsa:                       Not affected
Vulnerability Tsx async abort:           Not affected
Vulnerability Vmscape:                   Not affected

NAME     SIZE FSTYPE MOUNTPOINT MODEL
sda    476.9G                   TEAM T253512GB
├─sda1   476G ext4   /          
├─sda2     1K                   
└─sda5   975M swap   [SWAP]     
zram0    3.8G        [SWAP]     

## services.txt
# generated: 2026-03-15 21:43:38 CDT | host: toughbook

### Running services
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

## storage.txt
# generated: 2026-03-15 21:43:38 CDT | host: toughbook

### Storage
Filesystem          Size  Used Avail Use% Mounted on
udev                3.8G     0  3.8G   0% /dev
tmpfs               774M  1.5M  773M   1% /run
/dev/sda1           468G   66G  379G  15% /
tmpfs               3.8G     0  3.8G   0% /dev/shm
tmpfs               5.0M  8.0K  5.0M   1% /run/lock
tmpfs               774M  2.5M  772M   1% /run/user/1000
tup@192.168.4.76:/  457G  245G  190G  57% /mnt/myserver

