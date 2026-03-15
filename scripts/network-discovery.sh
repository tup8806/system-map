#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTFILE="$REPO_DIR/outputs/network-discovery.txt"

NETWORK="192.168.4.0/22"

{
echo "# Network Discovery Snapshot"
echo
echo "Generated: $(date)"
echo

echo "## ARP Scan (MAC + Vendor)"
sudo arp-scan --localnet --ouifile=/usr/share/arp-scan/ieee-oui.txt 2>/dev/null || echo "arp-scan failed"
echo

echo "## Nmap Ping Scan"
nmap -sn "$NETWORK"
echo

echo "## Neighbor Table"
ip neigh
echo

echo "## Known Devices (from configs if present)"
if [ -f "$REPO_DIR/configs/network-devices.csv" ]; then
    cat "$REPO_DIR/configs/network-devices.csv"
else
    echo "No device registry yet."
fi
echo

} > "$OUTFILE"

echo "Network discovery written to:"
echo "$OUTFILE"
