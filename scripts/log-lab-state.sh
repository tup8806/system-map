#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
LOGFILE="$REPO_DIR/LAB_HISTORY.md"

echo "## Snapshot: $(date)" >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "### Host" >> "$LOGFILE"
hostname >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "### Disk Usage" >> "$LOGFILE"
df -h | head -n 5 >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "### Running Containers" >> "$LOGFILE"
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "---" >> "$LOGFILE"
echo "" >> "$LOGFILE"
