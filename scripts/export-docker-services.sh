#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT="$REPO_DIR/configs/server-services.csv"
TMPFILE="$(mktemp)"

echo "id,container_name,image,status,ports,restart_policy" > "$OUT"

docker ps --format '{{.Names}}' > "$TMPFILE"

if [ ! -s "$TMPFILE" ]; then
    echo "No running Docker containers found on this machine."
    echo "If you expected server containers, run this script on the server host."
    rm -f "$TMPFILE"
    exit 1
fi

while IFS= read -r name
do
    id=$(echo "$name" | tr '-' '_')

    image=$(docker inspect -f '{{.Config.Image}}' "$name" 2>/dev/null || echo "unknown")
    status=$(docker inspect -f '{{.State.Status}}' "$name" 2>/dev/null || echo "unknown")
    restart_policy=$(docker inspect -f '{{.HostConfig.RestartPolicy.Name}}' "$name" 2>/dev/null || echo "none")
    ports=$(docker port "$name" 2>/dev/null | paste -sd '; ' -)

    if [ -z "$ports" ]; then
        ports="none"
    fi

    clean_name=$(echo "$name" | sed 's/,/;/g')
    clean_image=$(echo "$image" | sed 's/,/;/g')
    clean_status=$(echo "$status" | sed 's/,/;/g')
    clean_ports=$(echo "$ports" | sed 's/,/;/g')
    clean_restart=$(echo "$restart_policy" | sed 's/,/;/g')

    echo "$id,$clean_name,$clean_image,$clean_status,$clean_ports,$clean_restart" >> "$OUT"
done < "$TMPFILE"

rm -f "$TMPFILE"

echo "Wrote $OUT"
