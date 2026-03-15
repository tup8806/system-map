#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTFILE="$REPO_DIR/outputs/network-discovery.txt"

NETWORK="192.168.4.0/22"

echo "Network discovery scan" > "$OUTFILE"
echo "Generated: $(date)" >> "$OUTFILE"
echo "" >> "$OUTFILE"

nmap -sn "$NETWORK" >> "$OUTFILE"

echo "" >> "$OUTFILE"
echo "Neighbor table snapshot:" >> "$OUTFILE"
echo "" >> "$OUTFILE"

ip neigh >> "$OUTFILE"

echo ""
echo "Network scan written to:"
echo "$OUTFILE"
