#!/bin/bash
set -e

BASE="$HOME/system-map"

echo "# System Map Context"
echo
echo "Updated: $(date)"
echo

echo "## Latest Commit"
git -C "$BASE" log -1 --oneline 2>/dev/null || echo "No git commit found yet"
echo

echo "## Network"
cat "$BASE/outputs/network.txt" 2>/dev/null || echo "No network snapshot found"
echo

echo "## Storage"
cat "$BASE/outputs/storage.txt" 2>/dev/null || echo "No storage snapshot found"
echo

echo "## Services"
cat "$BASE/outputs/services.txt" 2>/dev/null || echo "No services snapshot found"
echo
