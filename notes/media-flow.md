# Media Flow

This document explains how media moves through the server.

Server: Dell Optiplex 7010
IP: 192.168.4.76


------------------------------------------------------------
Media Pipeline
------------------------------------------------------------

Media files are stored on the server.

Locations:

/media/movies
/media/tv
/media/music


------------------------------------------------------------
Processing Flow
------------------------------------------------------------

Media file added
      |
      v
Tdarr scans library
      |
      v
Tdarr transcodes or optimizes file
      |
      v
Jellyfin indexes media
      |
      v
Client devices stream content


------------------------------------------------------------
Client Devices
------------------------------------------------------------

Examples:

Roku TV
Computers on the network
Future smart TVs


------------------------------------------------------------
Services Involved
------------------------------------------------------------

Tdarr
Automated media transcoding

Jellyfin
Media server and streaming platform


------------------------------------------------------------
Access URLs
------------------------------------------------------------

Jellyfin
http://192.168.4.76:8096

Tdarr
http://192.168.4.76:8265
