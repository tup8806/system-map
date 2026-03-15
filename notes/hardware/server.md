# Dell Optiplex 7010

Desktop system used as the primary home server in this lab.

---

## System Overview

- Model: Dell Optiplex 7010
- Hostname: server
- Operating System: Debian

Primary roles:

- home server
- media server
- self-hosted service platform
- storage and file-serving system
- infrastructure node for the lab

---

## CPU

- Model: Intel Core i5-3470
- Architecture: x86_64
- Cores: 4
- Threads: 4
- Base clock: 3.20 GHz
- Max clock: 3.60 GHz
- Virtualization: Intel VT-x supported

This is a 3rd-generation Intel Core desktop processor (Ivy Bridge).

---

## Memory

- Installed RAM: 16 GB DDR3
- Reported usable memory: about 15 GiB
- Swap partition: about 1 GB

The system currently has ample RAM headroom for light server workloads.

---

## Storage

### Primary Drive
- Model: WDC WD5000AAKX-60U6AA0
- Type: SATA hard drive
- Capacity: 500 GB

### Partition Layout
- `/dev/sda1` - root filesystem
- `/dev/sda5` - swap partition

### Optical Drive
- TSSTcorp DVD-ROM SN-108DN

Current storage appears to be a single main hard drive with a standard Debian partition layout.

---

## Graphics

- Intel integrated graphics
- Provided by the Ivy Bridge CPU platform

This is sufficient for:

- local console use
- light desktop tasks
- basic video output
- some hardware-accelerated media tasks depending on software configuration

---

## Network Hardware

### Ethernet
- Intel 82579LM Gigabit Network Connection

This is the server's primary network interface.

No dedicated Wi-Fi hardware is currently shown in the provided hardware scan.

---

## Chipset and Platform

- Intel Q77 Express chipset
- Intel 7 Series / C216 family SATA controller
- Intel Management Engine Interface present

This is a stable business-desktop platform well suited to home server use.

---

## USB Devices Currently Detected

- Microsoft Xbox 360 Controller
- MosArt 2.4G wireless mouse
- Intel integrated USB hubs

These devices may change depending on what is plugged into the system.

---

## Hardware Scan References

Raw hardware scan outputs are stored in the repository.

### Main hardware files
- `outputs/server/cpu.txt`
- `outputs/server/storage.txt`
- `outputs/server/lspci.txt`
- `outputs/server/lsusb.txt`

If the current file paths differ, update this section to match the actual export locations used by the repo.

---

## Notes

The Optiplex 7010 is the main always-on infrastructure machine in the lab.

Important strengths of this system:

- reliable Intel desktop platform
- gigabit Ethernet
- standard SATA storage
- simple Linux compatibility
- easy maintenance and parts availability

Limitations of the current configuration:

- only one main storage drive is shown
- limited swap space
- no dedicated GPU
- storage expansion may be needed for long-term media growth

This machine is practical, repairable, and well suited to incremental home server upgrades.
