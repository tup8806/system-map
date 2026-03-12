# Server Quick Reference

Server: Dell Optiplex 7010
IP: 192.168.4.76


------------------------------------------------------------
SSH Access
------------------------------------------------------------

From the Toughbook:

ssh tup@192.168.4.76


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


------------------------------------------------------------
Docker Commands
------------------------------------------------------------

List containers

docker ps


Restart a container

docker restart jellyfin
docker restart tdarr


Restart all containers

docker restart $(docker ps -q)


------------------------------------------------------------
Storage Locations
------------------------------------------------------------

Movies
/media/movies

TV
/media/tv

Music
/media/music


RetroPie ROMs
~/RetroPie/roms

RetroPie BIOS
~/RetroPie/BIOS


------------------------------------------------------------
Useful System Commands
------------------------------------------------------------

Check disk layout

lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT,MODEL

Check disk space

df -h

Check running services

systemctl list-units --type=service
