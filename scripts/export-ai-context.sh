#!/bin/bash
set -e

BASE="$HOME/system-map"

echo "# System Map Context"
echo
echo "Updated: $(date)"
echo

echo "## Latest Commit"
git -C "$BASE" log -1 --oneline 2>/dev/null || echo "No git commit found"
echo

echo "## Network"
cat "$BASE/outputs/network.txt" 2>/dev/null || echo "No network snapshot"
echo

echo "## Storage"
cat "$BASE/outputs/storage.txt" 2>/dev/null || echo "No storage snapshot"
echo

echo "## Local Services"
cat "$BASE/outputs/services.txt" 2>/dev/null || echo "No local services snapshot"
echo

echo "## Server Docker Containers"
cat "$BASE/outputs/server/docker-containers.txt" 2>/dev/null || echo "No docker container snapshot"
echo

echo "## Server Running Services"
cat "$BASE/outputs/server/running-services.txt" 2>/dev/null || echo "No server service snapshot"
echo

echo "## Server Storage"
cat "$BASE/outputs/server/storage.txt" 2>/dev/null || echo "No server storage snapshot"
echo
