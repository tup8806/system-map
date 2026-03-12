# Server Services

Server: Dell Optiplex 7010
OS: Debian-based Linux

Primary IP:
192.168.4.76


------------------------------------------------
Docker Infrastructure
------------------------------------------------

Docker
Container runtime used for server services.

Portainer
Web interface for managing Docker containers.

Access:
http://192.168.4.76:9000


------------------------------------------------
Media Services
------------------------------------------------

Jellyfin
Media streaming server.

Access:
http://192.168.4.76:8096

Libraries:

/media/movies
/media/tv
/media/music


Tdarr
Automated media transcoding system.

Access:
http://192.168.4.76:8265

Purpose:

Optimizes media files for streaming and storage efficiency.


------------------------------------------------
Monitoring
------------------------------------------------

Uptime Kuma

Access:
http://192.168.4.76:3001

Purpose:

Monitors server and network services.


------------------------------------------------
Emulation System
------------------------------------------------

RetroPie

Provides emulator cores and system configuration.

Frontend:

EmulationStation

ROM directory:

~/RetroPie/roms

BIOS directory:

~/RetroPie/BIOS
------------------------------------------------
Network Services
------------------------------------------------

SSH

Remote administration access.


Samba

Network file sharing service.


------------------------------------------------
Security
------------------------------------------------

Fail2ban

Automatically blocks repeated failed login attempts.


------------------------------------------------
Hardware Monitoring
------------------------------------------------

lm-sensors

CPU and hardware temperature monitoring.


smartmontools

Disk health monitoring.


------------------------------------------------
Future Services
------------------------------------------------

OpenClaw

AI automation system planned for lab integration.
