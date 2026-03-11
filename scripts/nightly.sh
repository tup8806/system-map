#!/bin/bash
cd "$HOME/system-map" || exit 1
./scripts/update-system-map.sh
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
