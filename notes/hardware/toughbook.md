# Panasonic Toughbook CF-31

Rugged field laptop used as the primary administration and experimentation machine for the home lab.

---

# System Overview

Model: Panasonic Toughbook CF-31  
Hostname: toughbook  
Operating System: Debian (XFCE desktop)

Primary roles:

- server administration
- network diagnostics
- portable Linux experimentation
- hardware tuning and testing
- command-line AI tooling

---

# CPU

Intel Core i5 M 520  
Architecture: x86_64  
Cores: 2  
Threads: 4  
Base clock: 2.40 GHz  
Virtualization: Intel VT-x supported

This is a 1st generation Intel Core mobile processor (Arrandale).

---

# Memory

Installed RAM: 8 GB DDR3

Memory usage is typically managed with:

- zram swap
- standard disk swap partition

---

# Storage

Primary Drive

Drive model: TEAM T253512GB  
Capacity: 512 GB SATA SSD  

Partition layout:

/dev/sda1   root filesystem  
/dev/sda5   swap partition

The system also uses a zram compressed RAM swap device.

---

# Graphics

Integrated Intel graphics (Arrandale generation).

Provided by the CPU's integrated GPU.

Used for:

- XFCE desktop
- basic GPU acceleration
- light graphical workloads

---

# Network Hardware

Ethernet

Intel 82577LM Gigabit Network Controller

Wireless

Intel Centrino Advanced-N 6200 Wi-Fi adapter

---

# Bluetooth

Internal Bluetooth adapter detected as:

ALPS UGTZ4 Bluetooth module

Controller address:

04:76:6E:71:24:B9

Bluetooth is used primarily for:

- audio devices
- wireless peripherals

---

# Cellular Modem

Internal cellular modem detected:

Qualcomm Gobi 2000

This hardware originally supported mobile broadband connectivity in field deployments.

Current usage in the lab environment is minimal.

---

# Other Hardware Components

Touchscreen

Fujitsu USB touch panel controller.

Expansion / peripheral controllers

Ricoh CardBus bridge  
Ricoh SD card controller

These provide legacy expansion capability.

---

# USB Devices (Typical)

Logitech Nano Receiver (wireless keyboard/mouse)

Bluetooth controller

Integrated USB hubs

---

# Hardware Scans

Raw hardware scans are stored in the repository.

CPU information:

outputs/cpu.txt

Storage layout:

outputs/storage.txt

PCI device list:

outputs/lspci.txt

USB device list:

outputs/lsusb.txt

---

# Notes

The Toughbook serves as the portable control machine for the lab.

While older hardware, it remains extremely reliable due to:

- rugged construction
- excellent Linux compatibility
- stable Intel networking hardware

The machine is intentionally kept simple and well documented so it can be repaired or rebuilt easily.
