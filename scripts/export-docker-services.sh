#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT="$REPO_DIR/configs/server-services.csv"

TMPFILE="$(mktemp)"

docker ps --format '{{.Names}}|{{.Names}} {{.Ports}}' > "$TMPFILE"

echo "id,label" > "$OUT"

if [ ! -s "$TMPFILE" ]; then
    echo "No running Docker containers found on this machine."
    echo "If you expected server containers, run this script on the server host."
    rm -f "$TMPFILE"
    exit 1
fi

while IFS='|' read -r name label
do
    id=$(echo "$name" | tr '-' '_')
    clean_label=$(echo "$label" | sed 's/,/;/g')
    echo "$id,$clean_label" >> "$OUT"
done < "$TMPFILE"

rm -f "$TMPFILE"

echo "Wrote $OUT"
