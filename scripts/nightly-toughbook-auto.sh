#!/bin/bash
set -e

cd "$HOME/system-map" || exit 1

# Stop if there are manual edits waiting.
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Repository has uncommitted changes. Skipping auto snapshot."
    git status
    exit 1
fi

echo "Updating repository..."
git pull --rebase origin main

echo "Capturing local network identity..."
./scripts/capture-network.sh 2>/dev/null || true

echo "Running network discovery..."
./scripts/network-discovery.sh 2>/dev/null || true

echo "Generating device inventory..."
./scripts/generate-device-inventory.sh 2>/dev/null || true

echo "Generating network graph..."
./scripts/generate-network-graph.sh 2>/dev/null || true

echo "Generating lab dashboard..."
./scripts/generate-lab-dashboard.sh 2>/dev/null || true

echo "Exporting AI context..."
./scripts/export-ai-context.sh > ai-context.md

echo
echo "Reviewing changes..."
git status
git --no-pager diff --stat || true

echo
echo "Committing updates..."

git add outputs ai-context.md
git add configs/network-devices.csv configs/network-links.csv 2>/dev/null || true
git commit -m "Toughbook auto snapshot $(date '+%Y-%m-%d %H:%M')" || echo "No changes to commit"

git push

echo
echo "Toughbook auto nightly run complete."
