# Server Overview

## Machine
Optiplex home server on the local network.

Hostname: tup  
IP address: 192.168.4.76

## Main Roles

- Jellyfin media server
- Docker container host
- Samba file server
- Tdarr video processing server
- Uptime monitoring host

## Key Services

Jellyfin  
Media streaming server  
Port 8096

Uptime Kuma  
Service monitoring dashboard  
Port 3001

Portainer  
Docker management interface  
Port 9000

Tdarr  
Video processing and transcoding  
Ports 8265 and 8266

## Important Paths

/srv/media  
Main shared media library used by Jellyfin and Samba.

/srv/appdata/jellyfin  
Jellyfin configuration directory.

/your/config/tdarr  
Current Tdarr configuration directory.

## Relationship to Toughbook

The Toughbook laptop is the primary administration terminal.

Server management is typically done using SSH from the Toughbook.

------------------------------------------------------------
Service Dashboards
------------------------------------------------------------

Jellyfin
http://192.168.4.76:8096

Tdarr
http://192.168.4.76:8265

Uptime Kuma
http://192.168.4.76:3001

Portainer
http://192.168.4.76:9000
