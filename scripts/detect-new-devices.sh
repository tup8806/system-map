#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

KNOWN="$REPO_DIR/configs/known-devices.csv"
SCAN="$REPO_DIR/outputs/network-discovery.txt"
OUT="$REPO_DIR/outputs/new-devices.txt"
TMP="$(mktemp)"

if [ ! -f "$KNOWN" ]; then
  echo "Missing known devices file: $KNOWN" >&2
  exit 1
fi

if [ ! -f "$SCAN" ]; then
  echo "Missing scan file: $SCAN" >&2
  exit 1
fi

{
  echo "Unknown device check"
  echo "Generated: $(date)"
  echo
} > "$OUT"

grep "Nmap scan report for" "$SCAN" | awk '{print $5}' | sort -u > "$TMP"

FOUND=0
while read -r ip; do
  [ -z "$ip" ] && continue
  if ! awk -F, -v ip="$ip" 'NR > 1 && $2 == ip { found=1 } END { exit found ? 0 : 1 }' "$KNOWN"; then
    echo "Unknown device detected: $ip" >> "$OUT"
    FOUND=1
  fi
done < "$TMP"

if [ "$FOUND" -eq 0 ]; then
  echo "No unknown devices detected." >> "$OUT"
fi

rm -f "$TMP"
