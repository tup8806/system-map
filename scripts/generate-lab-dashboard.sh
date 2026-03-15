#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTFILE="$REPO_DIR/LAB_STATUS.md"

echo "# Lab Status Dashboard" > "$OUTFILE"
echo "" >> "$OUTFILE"
echo "Generated: $(date)" >> "$OUTFILE"
echo "" >> "$OUTFILE"

echo "## Server" >> "$OUTFILE"
echo "- Hostname: tup" >> "$OUTFILE"
echo "- IP: 192.168.4.76" >> "$OUTFILE"
echo "" >> "$OUTFILE"

echo "## Key Services" >> "$OUTFILE"
echo "| Service | URL | Purpose |" >> "$OUTFILE"
echo "|--------|-----|---------|" >> "$OUTFILE"
echo "| Jellyfin | http://192.168.4.76:8096 | Media server |" >> "$OUTFILE"
echo "| Portainer | http://192.168.4.76:9000 | Docker management |" >> "$OUTFILE"
echo "| Uptime Kuma | http://192.168.4.76:3001 | Monitoring dashboard |" >> "$OUTFILE"
echo "| Tdarr | http://192.168.4.76:8265 | Media transcoding |" >> "$OUTFILE"
echo "" >> "$OUTFILE"

echo "## System Snapshot" >> "$OUTFILE"

if [ -f "$REPO_DIR/outputs/system-summary.md" ]; then
    echo "" >> "$OUTFILE"
    echo "Recent system summary:" >> "$OUTFILE"
    echo "" >> "$OUTFILE"
    cat "$REPO_DIR/outputs/system-summary.md" >> "$OUTFILE"
else
    echo "System summary file not found." >> "$OUTFILE"
fi

echo "" >> "$OUTFILE"

echo "## Documentation Map" >> "$OUTFILE"
echo "- Inventory: INVENTORY.md" >> "$OUTFILE"
echo "- Hardware docs: notes/hardware/" >> "$OUTFILE"
echo "- Storage layout: notes/storage-layout.md" >> "$OUTFILE"
echo "- Network topology: notes/network-topology.md" >> "$OUTFILE"
echo "- Server services: notes/server-services.md" >> "$OUTFILE"
echo "- Server applications: notes/server-applications.md" >> "$OUTFILE"
