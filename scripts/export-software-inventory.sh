#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs/software"

mkdir -p "$OUT"

echo "Exporting software inventory to $OUT"

dpkg-query -W -f='${binary:Package}\t${Version}\n' > "$OUT/dpkg-packages.txt" 2>/dev/null || true
apt-mark showmanual > "$OUT/apt-manual.txt" 2>/dev/null || true
systemctl list-unit-files --type=service > "$OUT/systemd-unit-files.txt" 2>/dev/null || true
systemctl list-units --type=service --state=running > "$OUT/systemd-running-services.txt" 2>/dev/null || true
docker ps -a > "$OUT/docker-ps-a.txt" 2>/dev/null || true
snap list > "$OUT/snap-list.txt" 2>/dev/null || true
pip3 freeze > "$OUT/pip3-freeze.txt" 2>/dev/null || true
npm list -g --depth=0 > "$OUT/npm-global.txt" 2>/dev/null || true

echo "Done."
