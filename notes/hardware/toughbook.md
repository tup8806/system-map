# Panasonic Toughbook CF-31

Rugged field laptop used as the primary portable administration and experimentation machine for this home lab.

---

## System Overview

- Model: Panasonic Toughbook CF-31
- Hostname: toughbook
- Operating System: Debian with XFCE desktop

Primary roles:

- server administration
- network diagnostics
- portable Linux experimentation
- hardware tuning and testing
- command-line AI tooling

---

## CPU

- Model: Intel Core i5 M 520
- Architecture: x86_64
- Cores: 2
- Threads: 4
- Base clock: 2.40 GHz
- Virtualization: Intel VT-x supported

This is a 1st-generation Intel Core mobile processor.

---

## Memory

- Installed RAM: 8 GB DDR3
- Reported usable memory: about 7.6 GiB
- Swap:
  - disk swap partition
  - zram compressed swap device

---

## Storage

### Primary Drive
- Model: TEAM T253512GB
- Type: 2.5-inch SATA SSD
- Capacity: 512 GB

### Partition Layout
- `/dev/sda1` - root filesystem
- `/dev/sda5` - swap partition

### Additional Swap
- `zram0` - compressed RAM swap device

---

## Graphics

- Intel integrated graphics
- Provided by the Arrandale-generation CPU platform

Used for:

- XFCE desktop
- normal Linux graphical use
- light accelerated workloads

---

## Network Hardware

### Ethernet
- Intel 82577LM Gigabit Network Connection

### Wi-Fi
- Intel Centrino Advanced-N 6200

---

## Bluetooth

### Internal Bluetooth Adapter
- ALPS UGTZ4 Bluetooth module

### Active Controller
- Controller name: toughbook
- Controller address: 04:76:6E:71:24:B9

### rfkill Status
- Wi-Fi soft blocked: no
- Wi-Fi hard blocked: no
- Bluetooth soft blocked: no
- Bluetooth hard blocked: no

Bluetooth is used for:

- audio devices
- wireless peripherals

---

## Cellular / WWAN Hardware

Internal WWAN-related USB device detected as:

- Panasonic Qualcomm Gobi 2000

This hardware appears to be the internal mobile broadband modem currently detected by the system.

Current use in the lab is minimal.

---

## Touch and Expansion Hardware

### Touchscreen
- Fujitsu USB Touch Panel

### Expansion / Legacy Controllers
- Ricoh CardBus bridge
- Ricoh SD / SDIO / MMC / Memory Stick controller

These support legacy field-laptop expansion features.

---

## Other Detected USB Hardware

- Logitech Nano Receiver
- internal USB hubs
- Bluetooth adapter
- internal WWAN device
- touchscreen controller

---

## Hardware Scan References

Raw hardware scan outputs are stored in the repository.

### Main hardware files
- `outputs/cpu.txt`
- `outputs/storage.txt`
- `outputs/hardware/lspci.txt`
- `outputs/hardware/lsusb.txt`

---

## Notes

The Toughbook serves as the portable control machine for the lab.

Important strengths of this machine:

- rugged construction
- very good Linux compatibility
- stable Intel networking hardware
- built-in wireless and field-oriented expansion features

This hardware is old but practical, repairable, and well suited to portable admin work.
