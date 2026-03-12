#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs"

mkdir -p "$OUT"

echo "### Hardware" > "$OUT/hardware.txt"
lscpu >> "$OUT/hardware.txt" 2>/dev/null || true
echo >> "$OUT/hardware.txt"
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT,MODEL >> "$OUT/hardware.txt" 2>/dev/null || true

echo "### Network" > "$OUT/network.txt"
ip -brief address >> "$OUT/network.txt" 2>/dev/null || true
echo >> "$OUT/network.txt"
ip route >> "$OUT/network.txt" 2>/dev/null || true

echo "### Running services" > "$OUT/services.txt"
docker ps >> "$OUT/services.txt" 2>/dev/null || echo "Docker not available"

echo "### Storage" > "$OUT/storage.txt"
df -h >> "$OUT/storage.txt" 2>/dev/null || true
