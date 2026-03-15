# Lab Inventory

High-level inventory of the machines and infrastructure in this home lab.

Detailed hardware scans, package lists, and system state snapshots are stored in the `outputs/` directory.

---

# Systems

| Device | Hostname | Role | OS | Notes |
|------|------|------|------|------|
| Panasonic Toughbook CF-31 | toughbook | Portable workstation / lab control machine | Debian (XFCE) | Used for administration, diagnostics, and development |
| Dell Optiplex 7010 | server | Home server | Debian | Runs media services and self-hosted infrastructure |

---

# Toughbook CF-31

## Role

Portable Debian workstation used for:

- server administration
- network diagnostics
- hardware tuning and power testing
- portable Linux experimentation
- command-line AI tooling

## Hardware Summary

CPU: see outputs/cpu.txt  
RAM: see outputs/memory.txt  
Storage: see outputs/storage.txt  
GPU: Intel integrated graphics

Detailed hardware scans are stored in:

outputs/hardware/

---

# Core Software Environment

Primary tools installed on the Toughbook:

- Docker
- Git
- OpenSSH / SSHFS
- Tor
- Samba tools
- OpenClaw
- Google Gemini CLI
- xscreensaver
- cmatrix
- smartmontools
- powertop
- zram-tools

Full package lists are stored in:

outputs/manual-packages.txt  
outputs/all-packages.txt

---

# Key System Snapshots

These files represent the current system state.

outputs/system-info.txt  
outputs/network.txt  
outputs/storage.txt  
outputs/running-services.txt  
outputs/systemd-timers.txt  
outputs/open-ports.txt

---

# Documentation

Additional machine documentation:

notes/toughbook-purpose.md  
notes/hardware/toughbook.md

Server documentation:

notes/server-overview.md  
notes/server-purpose.md  
notes/server-services.md

---

# Repository Structure

This repository separates documentation into three layers.

notes/  
Human-written architecture and purpose documentation

outputs/  
Machine-generated system snapshots

scripts/  
Automation used to generate inventory and diagnostics
