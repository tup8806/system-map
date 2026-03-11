# Server Hardware

## Machine

Dell Optiplex 7010

Converted desktop used as the primary home server.

## CPU

Intel i5 processor

Exact CPU information recorded in:

outputs/server/cpu.txt

## RAM

Current memory configuration recorded in:

outputs/server/memory.txt

Future upgrades may include additional RAM for container workloads.

## Graphics

Integrated Intel graphics.

Used for:

- Jellyfin hardware transcoding
- video encoding tasks
- Tdarr processing

## Storage

Current layout recorded in:

outputs/server/storage.txt

System disk:
500GB Western Digital HDD

Current usage:

- operating system
- Docker containers
- media storage
- application data

Future plan:

- add additional drives
- separate media storage from system disk
- increase long-term storage capacity

## Network

Ethernet connection to home network.

Server IP:

192.168.4.76

Used by:

- Jellyfin clients
- administration SSH
- container services

## Current Services

Running through Docker or system services:

- Jellyfin
- Tdarr
- Portainer
- Uptime Kuma
- Samba
- SSH

## Media Storage

Primary media directory:

/srv/media

Used by:

- Jellyfin
- Tdarr
- local emulator systems

## Role in Lab

The server acts as the **central service host** for the home network.

Responsibilities:

- media storage
- media streaming
- container services
- emulator hosting
- network file sharing

## Future Direction

Planned improvements:

- add additional storage drives
- expand media capacity
- reorganize container appdata
- eventually run OpenClaw from the server
- act as the central management point for the network
