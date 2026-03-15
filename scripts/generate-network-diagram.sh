#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTDIR="$REPO_DIR/outputs"
DOTFILE="$OUTDIR/network-map.dot"
PNGFILE="$OUTDIR/network-map.png"

mkdir -p "$OUTDIR"

cat <<'EOF' > "$DOTFILE"
digraph homelab {

rankdir=LR
node [shape=box]

router [label="Router\n192.168.4.1"]

server [label="Server\nOptiplex 7010\n192.168.4.76"]

toughbook [label="Toughbook\nAdmin Workstation"]

jellyfin [label="Jellyfin\n:8096"]
tdarr [label="Tdarr\n:8265-8266"]
portainer [label="Portainer\n:9000"]
uptime [label="Uptime Kuma\n:3001"]

router -> server
router -> toughbook

server -> jellyfin
server -> tdarr
server -> portainer
server -> uptime

}
EOF

dot -Tpng "$DOTFILE" -o "$PNGFILE"

echo "Wrote:"
echo "  $DOTFILE"
echo "  $PNGFILE"
