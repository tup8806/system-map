#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

KNOWN="$REPO_DIR/configs/known-devices.csv"
SCAN="$REPO_DIR/outputs/network-discovery.txt"
OUT="$REPO_DIR/outputs/device-inventory.md"

echo "# Network Device Inventory" > "$OUT"
echo "" >> "$OUT"
echo "Generated: $(date)" >> "$OUT"
echo "" >> "$OUT"

echo "## Known Devices" >> "$OUT"
echo "" >> "$OUT"
echo "| IP | Name | Notes |" >> "$OUT"
echo "|----|------|------|" >> "$OUT"

tail -n +2 "$KNOWN" | while IFS=',' read ip name notes
do
    echo "| $ip | $name | $notes |" >> "$OUT"
done

echo "" >> "$OUT"
echo "## Devices Seen In Last Scan" >> "$OUT"
echo "" >> "$OUT"

grep "Nmap scan report for" "$SCAN" | awk '{print $5}' | while read ip
do
    echo "- $ip" >> "$OUT"
done
