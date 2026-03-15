# Storage Layout

This document describes the current storage layout of the home server and how media and game content are organized.

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
- server data
- media storage
- RetroPie game storage

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

This means the server still has usable free space, but media and game growth will eventually require more storage.

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

This suggests `/srv` is being used as the main area for self-hosted service data.

---

## Media Library Layout

The main media library path is:

- `/srv/media`

Current media categories:

- `/srv/media/movies`
- `/srv/media/tv`
- `/srv/media/music`

This is the main content library used by Jellyfin.

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

## RetroPie and EmulationStation Storage

The retro gaming library is stored separately from the media library.

RetroPie root directory:

- `/home/tup/RetroPie`

Important RetroPie paths:

- BIOS files: `/home/tup/RetroPie/BIOS`
- menu files: `/home/tup/RetroPie/retropiemenu`
- ROM library: `/home/tup/RetroPie/roms`

Current ROM library includes many system folders such as:

- `nes`
- `snes`
- `n64`
- `nds`
- `psx`
- `mame`
- `mame-libretro`
- `genesis`
- `megadrive`
- `mastersystem`
- `gamegear`
- `gba`
- `gb`
- `gbc`

This means the server currently stores two different kinds of entertainment content:

- streaming media under `/srv/media`
- retro game content under `/home/tup/RetroPie`

---

## Current Design Summary

The current storage design is:

- one internal hard drive
- one root filesystem
- OS, media, service data, and RetroPie content stored on the same disk
- service data organized mostly under `/srv`
- RetroPie stored under `/home/tup/RetroPie`
- Jellyfin reading media from `/srv/media`

This is simple and understandable, but all major content currently depends on a single disk.

---

## Advantages of Current Layout

- simple and easy to troubleshoot
- no separate mount complexity
- Jellyfin path mapping is straightforward
- service data is grouped under `/srv`
- RetroPie uses standard home-directory paths
- media and game libraries are clearly separated logically

---

## Current Limitations

- only one main storage drive is present
- operating system, media, and game content share the same disk
- no dedicated backup drive is shown
- no separate media filesystem is shown
- RetroPie content is stored under the user home directory instead of a central shared content path
- future storage expansion will be needed as the media and ROM libraries grow

This layout is practical for now, but it is not ideal for long-term storage growth or fault tolerance.

---

## Future Storage Goals

Likely future improvements:

1. add one or more larger drives for media and game storage
2. separate OS storage from bulk content storage
3. add a backup strategy for important data
4. decide whether RetroPie content should remain under `/home/tup/RetroPie` or move to a shared storage path
5. keep Jellyfin media paths stable even if disks change underneath
6. document future mount points clearly

A good long-term goal is to preserve stable logical paths even if the underlying storage changes.

---

## Notes

The current server acts both as:

- a home media server
- a retro gaming and entertainment machine

That means storage planning needs to account for both:

- video and music library growth
- ROM, BIOS, and emulator-related content
