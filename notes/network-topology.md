# Network Topology

## Main Devices

### Toughbook
Portable Linux workstation used for:
- server administration
- network diagnostics
- SSH access
- system-map updates
- AI command-line tools

### Optiplex Server
Main home server used for:
- media storage
- Jellyfin streaming
- emulator hosting
- Docker services
- network file sharing

### Router
Main gateway for the local network.

Provides:
- internet access
- DNS
- local routing

## Important Addresses

- Server: 192.168.4.76
- Gateway / Router: 192.168.4.1

## Relationship Between Systems

The Toughbook is the primary control machine.

The Toughbook connects to the server over SSH and is used to:
- manage services
- inspect hardware
- update the system map
- troubleshoot networking

The server provides services to the rest of the local network.

## Server Services Exposed on LAN

### Jellyfin
- Port 8096
- media streaming

### Uptime Kuma
- Port 3001
- service monitoring

### Portainer
- Port 9000
- Docker management

### Tdarr
- Ports 8265 and 8266
- video processing and transcoding

## Shared Paths

### Server
- /srv/media
- /srv/appdata/jellyfin
- /your/config/tdarr
- /tmp/tdarr

## Future Direction

Planned future improvements:
- add more drives to the server
- expand media storage
- improve storage layout
- eventually run OpenClaw from the server
- use the server as a central management point for the home network
