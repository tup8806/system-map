#!/bin/bash
set -e

cd "$HOME/system-map" || exit 1

echo "Updating repository..."
git pull --rebase origin main

echo "Running network scan..."
./scripts/scan-network.sh 2>/dev/null || true

echo "Generating device inventory..."
./scripts/generate-device-inventory.sh 2>/dev/null || true

echo "Generating network graph..."
./scripts/generate-network-graph.sh 2>/dev/null || true

echo "Exporting AI context..."
./scripts/export-ai-context.sh > ai-context.md

echo
echo "Opening CHANGES.md for tonight's notes..."
sleep 1
nano CHANGES.md

echo
echo "Reviewing changes..."
git status
git --no-pager diff --stat

echo
echo "Committing updates..."

git add outputs ai-context.md CHANGES.md
git add configs/network-devices.csv configs/network-links.csv 2>/dev/null || true
git commit -m "Toughbook lab snapshot $(date '+%Y-%m-%d %H:%M')" || echo "No changes to commit"

git push

echo
echo "Toughbook nightly run complete."
