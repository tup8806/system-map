# Server Storage Layout

Server: Dell Optiplex 7010
IP Address: 192.168.4.76

This document records how storage is organized on the server.


------------------------------------------------------------
Media Storage
------------------------------------------------------------

Movies
/media/movies

TV Shows
/media/tv

Music
/media/music


------------------------------------------------------------
RetroPie Storage
------------------------------------------------------------

ROM directory
~/RetroPie/roms

BIOS directory
~/RetroPie/BIOS


------------------------------------------------------------
Future Storage Expansion
------------------------------------------------------------
additional media drives
dedicated backup drive
archive storage

------------------------------------------------------------
Physical Disk Layout
------------------------------------------------------------

Primary Drive

Device: /dev/sda
Model: WDC WD5000
Size: 465.8 GB

Partitions

/dev/sda1
Filesystem: ext4
Mount point: /
Purpose: Operating system and server data

/dev/sda5
Filesystem: swap
Purpose: virtual memory
Planned improvements:

