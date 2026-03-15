# Storage Layout

This document describes the current storage layout of the home server and how media is organized for services such as Jellyfin.

---

## Current Physical Storage

The server currently shows one main internal storage drive.

### Primary Drive
- Model: WDC WD5000AAKX
- Capacity: 500 GB
- Device: `/dev/sda`
- Partition table: DOS / MBR

This drive currently holds both:

- the Debian operating system
- server data and media storage

---

## Partition Layout

The current partition layout is:

- `/dev/sda1` - main Linux filesystem, mounted at `/`
- `/dev/sda5` - swap partition

### Details

- `/dev/sda1` size: about 464.8 GB
- `/dev/sda5` size: about 975 MB

This is a simple single-disk Debian layout.

---

## Filesystem Usage

Current filesystem usage from `df -h`:

- Root filesystem `/`: 457 GB total
- Used: 244 GB
- Available: 190 GB
- Usage: 57%

This means the server still has usable free space, but media growth will eventually require more storage.

---

## Service Storage Root

The main service data directory is:

- `/srv`

Current top-level directories under `/srv`:

- `/srv/appdata`
- `/srv/downloads`
- `/srv/games`
- `/srv/media`
- `/srv/stacks`

This suggests `/srv` is being used as the primary area for self-hosted service data.

---

## Media Library Layout

The main media library path is:

- `/srv/media`

Current media categories:

- `/srv/media/movies`
- `/srv/media/tv`
- `/srv/media/music`

This is a clean and sensible layout for media server use.

---

## Jellyfin Media Mount

Jellyfin is configured to mount the host media directory like this:

- Host path: `/srv/media`
- Container path: `/media`

Docker bind mount:

- `/srv/media:/media:rw`

This means Jellyfin sees the media library inside the container at:

- `/media/movies`
- `/media/tv`
- `/media/music`

---

## Current Design Summary

The current storage design is:

- one internal hard drive
- one root filesystem
- OS and media stored on the same disk
- service data organized under `/srv`
- Jellyfin reading media from `/srv/media`

This is easy to understand and simple to manage, which is good for a starter server.

---

## Advantages of Current Layout

- simple and easy to troubleshoot
- no separate mount complexity
- Jellyfin path mapping is straightforward
- service data is grouped under `/srv`
- media categories are clearly separated

---

## Current Limitations

- only one main storage drive is present
- operating system and media share the same disk
- no dedicated backup drive is shown
- no separate media filesystem is shown
- future storage expansion will be needed as the library grows

This layout is practical for now, but it is not ideal for long-term media growth or fault tolerance.

---

## Future Storage Goals

Likely future improvements:

1. add one or more larger drives for media storage
2. separate OS storage from bulk media storage
3. add a backup strategy for important data
4. document exact mount points for future expansion
5. keep Jellyfin media paths stable even if disks change underneath

A good long-term goal is to preserve `/srv/media` as the main logical media path, even if it later becomes a mounted drive or pooled storage location.

---

## Notes

Current media examples show that the library already contains:

- movies
- TV series
- music collections

This confirms that `/srv/media` is actively in use as the main library root.

As the server grows, this file should be updated whenever:

- new drives are added
- mount points change
- backup storage is added
- media storage is moved off the root disk
