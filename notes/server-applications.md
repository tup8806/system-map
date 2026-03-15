# Server Applications

This document describes interactive applications installed on the server that are used directly at the console.

These programs are different from services.
They do not run continuously and usually do not expose network ports.

Server hostname: tup

---

## EmulationStation

Purpose:
Frontend interface used to browse and launch retro games.

Typical use:

- launched locally on the server
- displayed on a connected TV or monitor
- navigated using game controllers

EmulationStation acts as the main user interface for the entertainment side of the server.

---

## RetroPie Components

RetroPie provides emulator configuration and integration used by EmulationStation.

It manages:

- emulator configuration
- controller mapping
- ROM directory structure
- BIOS storage
- game launching

Common system folders currently present under the ROM library include:

- nes
- snes
- n64
- nds
- psx
- mame
- mame-libretro
- genesis
- megadrive
- mastersystem
- gamegear
- gba
- gb
- gbc
- neogeo
- fba
- pcengine
- sega32x
- segacd
- atari2600
- atari5200
- atari7800
- atari800
- atarilynx
- amstradcpc
- coleco
- msx
- vectrex
- zxspectrum

Exact emulator cores and per-system configuration may vary over time.

---

## RetroPie Storage Layout

RetroPie is installed in the user's home directory:

- `/home/tup/RetroPie`

Important paths:

- BIOS files: `/home/tup/RetroPie/BIOS`
- menu content: `/home/tup/RetroPie/retropiemenu`
- ROM library: `/home/tup/RetroPie/roms`

This means the gaming library is currently separate from the media library used by Jellyfin.

---

## Controller Hardware

Controllers detected on the server include:

- Xbox 360 controller

These are used for:

- navigating EmulationStation
- playing games launched through RetroPie

---

## Role of the Server

The server has two major roles.

### Infrastructure services

- Jellyfin
- Tdarr
- Uptime Kuma
- Portainer
- file sharing
- SSH administration

### Entertainment system

- EmulationStation
- RetroPie emulators
- game controllers
- local display output

This allows the same machine to function both as a home server and a retro gaming console.

---

## Notes

Because these applications run interactively, they will not appear in:

- `docker ps`
- `ss -ltnp`
- most service lists

They are launched manually or through the desktop environment.

The current entertainment stack is stored primarily under the `tup` user's home directory rather than under `/srv`.
