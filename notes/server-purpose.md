# Server Purpose

## Primary Uses
- media storage device
- Jellyfin media server
- game emulator host
- Docker service host
- network-accessible file server

## Current Network Role

This machine is the main home server on the local network.

It stores media, serves media to client devices, hosts emulator-related services, and provides shared storage and container-based services.

## Important Software and Services
- Jellyfin
- Tdarr
- Portainer
- Uptime Kuma
- Samba
- Docker
- RetroPie / EmulationStation
- SSH

## Important Paths
- /srv/media
- /srv/appdata/jellyfin
- /your/config/tdarr
- /tmp/tdarr

## Key Capabilities
- media storage and streaming
- shared file access over the local network
- Docker container hosting
- emulator and game-related hosting
- remote administration over SSH
- service monitoring

## Related Systems
- Toughbook portable administration laptop

## Future Direction
- add more storage drives
- improve storage layout for media growth
- move toward running OpenClaw from the server
- use the server as a central management point for the home network

## Notes
- server-specific outputs are stored in outputs/server/
- server-specific copied configs are stored in configs/server/
- Tdarr currently uses /your/config/tdarr and should later be cleaned up into a more standard appdata path
