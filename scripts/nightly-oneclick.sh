#!/bin/bash
cd "$HOME/system-map" || exit 1

./scripts/update-system-map.sh

echo
echo "Opening CHANGES.md for tonight's notes..."
sleep 1

nano CHANGES.md

echo
echo "Reviewing changes..."
git status
echo
git diff --stat

echo
echo "Updating git repository..."

git add outputs/server configs/server notes/server-purpose.md scripts/update-system-map.sh scripts/nightly-oneclick.sh CHANGES.md 2>/dev/null || true

git commit -m "Server snapshot $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "No changes to commit"

git push 2>/dev/null || echo "Git push skipped or failed"

echo
echo "Server snapshot complete."
echo

exec bash
