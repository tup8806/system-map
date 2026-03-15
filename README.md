# System Map

This repository documents the structure and configuration of a personal home lab.

The goal is to maintain a clear map of the system so the environment can be:

- understood quickly
- rebuilt if necessary
- expanded without losing track of how things work

The repository combines human documentation with automated system snapshots.

---

# Lab Overview

The lab currently consists of two primary machines.

| Machine | Role |
|-------|------|
| Panasonic Toughbook CF-31 | Portable workstation used for administration and diagnostics |
| Dell Optiplex 7010 | Home server providing media services, infrastructure services, and retro gaming |

---

# Server Roles

The server performs two major functions.

### Infrastructure Services
- Jellyfin media server
- Tdarr media processing
- Uptime Kuma monitoring
- Portainer Docker management
- Samba file sharing
- SSH administration
- OpenClaw AI gateway

### Entertainment System
- EmulationStation frontend
- RetroPie emulator environment
- console game libraries
- Xbox controller support

---

# Repository Structure

The repository is divided into three major documentation layers.
## Current Lab Layout

### Admin Workstation
Panasonic Toughbook CF-31 running Debian XFCE

Used for:
- administration
- network scanning
- generating diagrams
- editing repo scripts

### Server
Dell Optiplex 7010
- CPU: i5-3470
- RAM: 16 GB
- IP: 192.168.4.76

Runs:
- Jellyfin
- Tdarr
- Portainer
- Uptime-Kuma
- EmulationStation / RetroPie

### Network
Subnet:
- 192.168.4.0/22

Known devices:
- 192.168.4.1 router
- 192.168.4.23 Roku TV
- 192.168.4.59 Pixel phone
- 192.168.4.76 server
- 192.168.4.77 mesh node
- 192.168.4.82 toughbook

## File Ownership Rules

To avoid Git conflicts:

### Toughbook generates
- network scans
- device inventory
- network diagrams

### Server generates
- configs/server-services.csv

## Git Workflow

Before editing:
git pull --rebase origin main

After editing:
git add
git commit
git push

### Notes

Human-written documentation explaining system design and purpose.

Examples:
notes/hardware/
notes/network-topology.md
notes/storage-layout.md
notes/server-services.md
notes/server-applications.md

### Outputs

Automatically generated system snapshots such as:

- hardware scans
- package lists
- service inventories
- network information

These files reflect the **current state of the machines**.

### Scripts

Automation used to collect system information and update the repository.

These scripts allow the documentation to stay synchronized with the real systems.

---

# Important Documentation

## Lab Inventory
High-level overview of all machines.

INVENTORY.md

---

## Hardware Documentation
notes/hardware/toughbook.md
notes/hardware/server.md

Describes physical hardware including CPU, storage, networking, and peripherals.

---

## Storage Layout
notes/storage-layout.md

Explains:

- server disk layout
- media storage
- RetroPie game storage
- future storage plans

---

## Network Topology
notes/network-topology.md

Documents:

- LAN structure
- server IP addressing
- Docker network layout

---

## Server Services
notes/server-services.md

Lists services running on the server and how they are accessed.

---

## Server Applications
notes/server-applications.md

Documents interactive software such as:

- EmulationStation
- RetroPie
- game controllers

---

# Design Philosophy

This repository separates documentation into two types:

**Human documentation**
- explains why things are configured the way they are

**Automated outputs**
- record the actual system state

This prevents the documentation from drifting away from reality as the system evolves.

---

# Purpose

This repository acts as a technical reference for the home lab.

It allows the system to be:

- rebuilt if hardware fails
- expanded with new services
- understood by future maintainers
- analyzed by automation or AI tools

The intent is to keep the system understandable even years later.
