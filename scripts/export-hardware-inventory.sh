#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs/hardware"

mkdir -p "$OUT"

echo "Exporting hardware inventory to $OUT"

uname -a > "$OUT/uname.txt" 2>/dev/null || true
lscpu > "$OUT/lscpu.txt" 2>/dev/null || true
lsblk -o NAME,SIZE,FSTYPE,FSAVAIL,FSUSE%,MOUNTPOINT,MODEL > "$OUT/lsblk.txt" 2>/dev/null || true
lspci > "$OUT/lspci.txt" 2>/dev/null || true
lsusb > "$OUT/lsusb.txt" 2>/dev/null || true
ip -brief address > "$OUT/ip-address.txt" 2>/dev/null || true
ip route > "$OUT/ip-route.txt" 2>/dev/null || true
rfkill list > "$OUT/rfkill.txt" 2>/dev/null || true
nmcli device status > "$OUT/nmcli-device-status.txt" 2>/dev/null || true
nmcli connection show --active > "$OUT/nmcli-active-connections.txt" 2>/dev/null || true
bluetoothctl list > "$OUT/bluetooth-controllers.txt" 2>/dev/null || true

sudo dmidecode -t system > "$OUT/dmidecode-system.txt" 2>/dev/null || true
sudo dmidecode -t bios > "$OUT/dmidecode-bios.txt" 2>/dev/null || true
sudo dmidecode -t baseboard > "$OUT/dmidecode-baseboard.txt" 2>/dev/null || true
sudo dmidecode -t memory > "$OUT/dmidecode-memory.txt" 2>/dev/null || true

echo "Done."
