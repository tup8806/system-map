# Network Topology

This document describes the current network layout of the home lab.

---

# Local Network Overview

The lab operates on a private LAN behind a consumer router.

Router / Gateway:
- IP address: 192.168.4.1

Local network range:
- 192.168.4.0/22

All machines obtain connectivity through this gateway.

---

# Server

Hostname: tup  
Role: primary home server

Main network interface:

- Interface: eno1
- Address: 192.168.4.76
- Connected via Ethernet

Default route:

- Gateway: 192.168.4.1

This machine hosts most self-hosted services.

---

# Docker Networking

Docker creates internal virtual networks used by containers.

These networks exist only inside the server.

Current Docker bridge networks:

- 172.17.0.0/16 (docker0 default network)
- 172.18.0.0/16
- 172.22.0.0/16

Interfaces observed:

- docker0
- br-dc5ab34c9662
- br-0a5b42541c36

Additional `veth*` interfaces are temporary virtual ethernet links used by running containers.

These are normal and change frequently.

---

# Logical Network Diagram

Internet
│
Router / Gateway
192.168.4.1
│
──────────── LAN ────────────
│
Server (Optiplex 7010)
Hostname: tup
IP: 192.168.4.76
Interface: eno1
│
Docker networks
172.17.0.0/16
172.18.0.0/16
172.22.0.0/16

---

# Purpose of This Layout

The server sits on the LAN and exposes selected services to other machines in the house.

Typical services may include:

- Jellyfin
- OpenClaw
- file sharing
- SSH administration

Docker containers run inside isolated virtual networks but can expose ports to the main LAN.

---

# Notes

The Docker bridge networks are internal and do not affect normal LAN communication.

The only externally visible interface for the server is:

- eno1 (192.168.4.76)

All home devices access services through this LAN address.
