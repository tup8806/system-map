#!/bin/bash
set -e

cd "$HOME/system-map" || exit 1

echo "Updating repository..."
git pull --rebase origin main

echo "Exporting Docker services..."
./scripts/export-docker-services.sh

echo
echo "Reviewing changes..."
git status
git --no-pager diff --stat

echo
echo "Committing server updates..."

git add configs/server-services.csv
git commit -m "Server services snapshot $(date '+%Y-%m-%d %H:%M')" || echo "No changes to commit"

git push

echo
echo "Server nightly run complete."
