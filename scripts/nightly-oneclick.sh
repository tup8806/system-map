#!/bin/bash
set -e

cd "$HOME/system-map"

echo "Updating repository..."
git pull --rebase origin main

echo "Exporting live server services..."
./scripts/export-docker-services.sh

echo "Committing server state..."

git add configs/server-services.csv
git commit -m "Server state snapshot $(date '+%Y-%m-%d %H:%M')" || true

git push

echo "Server report complete."
