#!/bin/bash
set -e

BASE="$HOME/system-map"

"$BASE/scripts/update-system-map.sh"

echo
echo "Next steps:"
echo "1) Update your notes:"
echo "   nano CHANGES.md"
echo
echo "2) Review changes:"
echo "   git status"
echo "   git diff --stat"
echo
echo "3) Save snapshot:"
echo "   git add ."
echo "   git commit -m \"Nightly update\""
echo "   git push"

echo "Updating git repository..."

cd "$HOME/system-map"

git add outputs configs 2>/dev/null

git commit -m "Nightly system snapshot $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "No changes to commit"

git push 2>/dev/null || echo "Git push skipped or failed"

echo "Snapshot complete."
