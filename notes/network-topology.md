# Network Topology

This document describes the current observed network layout of the home lab and nearby household devices.

---

## Local Network Overview

The lab operates on a private LAN behind an Eero router.

- Gateway / primary router: `192.168.4.1`
- Local network range: `192.168.4.0/22`

The server is connected by Ethernet.
The Toughbook is connected by Wi-Fi.

---

## Core Lab Devices

### Server
- Hostname: `tup`
- Hardware: Dell Optiplex 7010
- Role: home server / media server / retro gaming system
- IP address: `192.168.4.76`
- Connection: Ethernet
- Main interface: `eno1`

### Toughbook
- Hostname: `toughbook`
- Hardware: Panasonic Toughbook CF-31
- Role: portable admin workstation
- IP address: `192.168.4.82`
- Connection: Wi-Fi
- Main interface: `wlp10s0`

---

## Infrastructure Devices

### Eero Router / Gateway
- IP address: `192.168.4.1`
- Role: main LAN gateway and Wi-Fi infrastructure

### Additional Eero Device / Mesh Node
- IP address: `192.168.4.77`
- Evidence:
  - MAC vendor prefix matches the router family
  - open TCP port `53`
  - open TCP port `3001`
  - responds like network infrastructure rather than a user device
- Working identification: likely an additional Eero mesh node

---

## Other Observed Network Devices

### AirPlay-Capable Media Device
- IP address: `192.168.4.23`
- Open TCP port: `7000`
- Service detection: `AirTunes rtspd 377.40.00`
- Working identification: likely a smart TV, speaker, or streaming device with AirPlay / AirTunes support

### Google Pixel 10
- IP address: `192.168.4.59`
- Device: Google Pixel 10
- Open TCP port observed: `2121`
- Service detection: `ftp` (`oftpd`)
- Purpose during scan: temporary Wi-Fi file transfer from phone to Toughbook

This was not a permanent infrastructure service.
It was opened intentionally to transfer media over Wi-Fi.

### Previously Seen Device
- IP address: `192.168.4.75`
- Seen in ARP / neighbor table earlier
- Did not respond to later `nmap` scan
- Current status: inactive, sleeping, or disconnected

---

## Server Networking

The server uses:

- LAN IP: `192.168.4.76`
- default gateway: `192.168.4.1`

Docker also creates internal virtual networks on the server:

- `172.17.0.0/16`
- `172.18.0.0/16`
- `172.22.0.0/16`

These are internal container networks and are not separate household devices.

---

## Logical Diagram

```text
Internet
   │
Eero Router / Gateway
192.168.4.1
   │
──────────── Household LAN ────────────
   │
   ├── Server (tup) ................ 192.168.4.76
   │      └── Docker internal networks
   │          ├── 172.17.0.0/16
   │          ├── 172.18.0.0/16
   │          └── 172.22.0.0/16
   │
   ├── Toughbook ................... 192.168.4.82
   ├── Eero mesh node? ............. 192.168.4.77
   ├── AirPlay media device ........ 192.168.4.23
   ├── google pixel 10 ........... 192.168.4.59
   └── inactive/unknown device ..... 192.168.4.75
