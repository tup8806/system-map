#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

KNOWN="$REPO_DIR/configs/known-devices.csv"
SCAN="$REPO_DIR/outputs/network-discovery.txt"
OUT="$REPO_DIR/outputs/new-devices.txt"

echo "Unknown device check" > "$OUT"
echo "Generated: $(date)" >> "$OUT"
echo "" >> "$OUT"

# extract IPs from the scan
grep "Nmap scan report for" "$SCAN" | awk '{print $5}' | while read ip
do
    if ! grep -q "$ip" "$KNOWN"; then
        echo "Unknown device detected: $ip" >> "$OUT"
    fi
done
