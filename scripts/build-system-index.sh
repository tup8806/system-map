#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

OUT="$REPO_DIR/outputs/system-index.json"

echo "Building system index..."

echo "{" > "$OUT"

echo '  "generated": "'"$(date)"'",' >> "$OUT"

echo '  "devices": [' >> "$OUT"

tail -n +2 "$REPO_DIR/configs/known-devices.csv" | while IFS=',' read id ip name notes
do
    echo '    {' >> "$OUT"
    echo '      "id": "'"$id"'",' >> "$OUT"
    echo '      "ip": "'"$ip"'",' >> "$OUT"
    echo '      "name": "'"$name"'",' >> "$OUT"
    echo '      "notes": "'"$notes"'"' >> "$OUT"
    echo '    },' >> "$OUT"
done

sed -i '$ s/,$//' "$OUT"

echo '  ]' >> "$OUT"

echo "}" >> "$OUT"

echo "System index generated:"
echo "$OUT"
