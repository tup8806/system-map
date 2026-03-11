#!/bin/bash
set -e

echo "Collecting server snapshot..."

"$HOME/system-map/scripts/update-system-map.sh"

echo "Updating git repository..."

cd "$HOME/system-map"

git add outputs/server configs/server scripts/update-system-map.sh 2>/dev/null || true

git commit -m "Server snapshot $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "No changes to commit"

git push 2>/dev/null || echo "Git push skipped or failed"

echo "Server snapshot complete."
