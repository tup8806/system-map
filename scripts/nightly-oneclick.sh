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
echo "When ready, run:"
echo "git add ."
echo "git commit -m \"Nightly update\""
echo "git push"
echo
exec bash
