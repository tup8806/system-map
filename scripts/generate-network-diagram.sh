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
    rankdir=LR;
    graph [label="Home Lab Network Map", labelloc=top, fontsize=20];
    node [shape=box, style=rounded];

    router [label="Eero Router\n192.168.4.1"];
    server [label="Server\nDell Optiplex 7010\nhostname: tup\n192.168.4.76"];
    toughbook [label="Toughbook\nPanasonic CF-31\nhostname: toughbook\nWi-Fi client"];
    
    jellyfin [label="Jellyfin\n:8096"];
    tdarr [label="Tdarr\n:8265-8266"];
    uptimekuma [label="Uptime Kuma\n:3001"];
    portainer [label="Portainer\n:9000"];
    samba [label="Samba\n:139, :445"];
    ssh [label="SSH\n:22"];
    openclaw [label="OpenClaw Gateway\nlocalhost only\n127.0.0.1:18789-18792"];

    router -> server [label="Ethernet"];
    router -> toughbook [label="Wi-Fi"];

    server -> jellyfin;
    server -> tdarr;
    server -> uptimekuma;
    server -> portainer;
    server -> samba;
    server -> ssh;
    server -> openclaw;
}
EOF

dot -Tpng "$DOTFILE" -o "$PNGFILE"

echo "Wrote:"
echo "  $DOTFILE"
echo "  $PNGFILE"
