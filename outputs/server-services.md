# Server Services

Updated: Sun Mar 15 12:16:44 PM CDT 2026

## tdarr
- Container name: tdarr
- Image: ghcr.io/haveagitgat/tdarr:latest
- Status: running
- Ports: 8265/tcp -> 0.0.0.0:8265;8266/tcp -> 0.0.0.0:8266
- Restart policy: unless-stopped

## jellyfin
- Container name: jellyfin
- Image: jellyfin/jellyfin:latest
- Status: running
- Ports: 8096/tcp -> 0.0.0.0:8096
- Restart policy: unless-stopped

## uptime_kuma
- Container name: uptime-kuma
- Image: louislam/uptime-kuma:1
- Status: running
- Ports: 3001/tcp -> 0.0.0.0:3001
- Restart policy: unless-stopped

## portainer
- Container name: portainer
- Image: portainer/portainer-ce:latest
- Status: running
- Ports: 9000/tcp -> 0.0.0.0:9000
- Restart policy: always

