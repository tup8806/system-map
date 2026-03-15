# System Map

This repository documents the hardware, software, and architecture of my personal home lab.

Primary workstation:
Panasonic Toughbook CF-31 (Mk1 rugged laptop)

Primary server:
Dell Optiplex 7010 running Docker services including Jellyfin.

The goal of this repository is to allow the system to be **understood and rebuilt** from documentation and exported configuration snapshots.

---

## Repository Structure

notes/
Human-written documentation explaining system purpose and architecture.

outputs/
Automatically generated system snapshots including hardware, software, and safe configuration exports.

scripts/
Automation scripts used to generate inventories and configuration exports.

ai-context.md
Condensed system snapshot intended as the primary entry point for AI tools.

---

## Key Hardware

**Laptop**
Panasonic Toughbook CF-31  
Intel Core i5-520M  
8GB DDR3  
2.5" SATA SSD  
WWAN module: Sierra Wireless MC8355  
RTL-SDR USB receiver for radio experiments.

**Server**
Dell Optiplex 7010  
Media server and home lab services.

**Embedded Devices**
Heltec WiFi LoRa 32 V3 boards (ESP32 + LoRa).

---

## Automation

System snapshots are generated using scripts located in:
scripts/


Key scripts include:

- export-hardware-inventory.sh
- export-software-inventory.sh
- export-configs.sh
- export-ai-context.sh

These scripts populate the `outputs/` directory.

---

## AI Usage

AI tools should start by reading:
ai-context.md

Then reference:
notes/
outputs/hardware/
outputs/software/
outputs/configs/

---

## Purpose

This repository exists to:

- document my hardware lab
- maintain reproducible system configuration
- support troubleshooting
- allow AI tools to understand the environment
