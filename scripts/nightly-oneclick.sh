#!/bin/bash
set -e
cd "$HOME/system-map" || exit 1

./scripts/update-system-map.sh
./scripts/collect-system-info.sh
./scripts/export-ai-context.sh > ai-context.md
./scripts/generate-system-summary.sh
./scripts/generate-lab-dashboard.sh
./scripts/log-lab-state.sh
./scripts/network-discovery.sh
./scripts/network-discovery.sh
./scripts/generate-device-inventory.sh
./scripts/detect-new-devices.sh
echo
echo "Opening CHANGES.md for tonight's notes..."
sleep 1

nano CHANGES.md

echo
echo "Reviewing changes..."
git status
echo
git --no-pager diff --stat

echo
echo "Updating git repository..."

git add CHANGES.md ai-context.md outputs scripts notes README.md AI_README.md .gitignore
git add scripts/update-system-map.sh scripts/nightly-oneclick.sh 2>/dev/null || true

git commit -m "Server snapshot $(date '+%Y-%m-%d %H:%M')" 2>/dev/null || echo "No changes to commit"

git push 2>/dev/null || echo "Git push skipped or failed"

echo
echo "Server snapshot complete."
echo

exec bash
