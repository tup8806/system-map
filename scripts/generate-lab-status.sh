#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs/lab-status.md"

{
echo "# Home Lab Status"
echo
echo "Generated: $(date)"
echo

echo "## Server Services"
if [ -f "$BASE/configs/server-services.csv" ]; then
    column -s, -t < "$BASE/configs/server-services.csv"
else
    echo "No server service data yet."
fi
echo

echo "## Discovered Devices"
if [ -f "$BASE/outputs/network-discovery.txt" ]; then
    grep -E "192\.168\." "$BASE/outputs/network-discovery.txt" | head -20
else
    echo "No discovery data yet."
fi
echo

echo "## Device Inventory"
if [ -f "$BASE/outputs/device-inventory.md" ]; then
    head -20 "$BASE/outputs/device-inventory.md"
else
    echo "No device inventory generated."
fi
echo

echo "## Disk Usage Snapshot"
if [ -f "$BASE/outputs/disk-usage.md" ]; then
    cat "$BASE/outputs/disk-usage.md"
else
    echo "No disk usage data yet."
fi
echo

echo "## Detailed Files"
echo "- outputs/network-identity.txt"
echo "- outputs/network-discovery.txt"
echo "- outputs/device-inventory.md"
echo "- configs/server-services.csv"
echo

} > "$OUT"

echo "Wrote $OUT"
