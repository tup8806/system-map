#!/bin/bash
set -e

BASE="$HOME/system-map"
IN="$BASE/configs/server-services.csv"
OUT="$BASE/outputs/server-services.md"

if [ ! -f "$IN" ]; then
    echo "Missing input file: $IN"
    exit 1
fi

{
    echo "# Server Services"
    echo
    echo "Updated: $(date)"
    echo

    tail -n +2 "$IN" | while IFS=',' read -r id container_name image status ports restart_policy
    do
        echo "## $id"
        echo "- Container name: $container_name"
        echo "- Image: $image"
        echo "- Status: $status"
        echo "- Ports: $ports"
        echo "- Restart policy: $restart_policy"
        echo
    done
} > "$OUT"

echo "Wrote $OUT"
