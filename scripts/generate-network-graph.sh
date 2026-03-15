#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

DEVICES="$REPO_DIR/configs/network-devices.csv"
SERVICES="$REPO_DIR/configs/server-services.csv"
LINKS="$REPO_DIR/configs/network-links.csv"
SCAN="$REPO_DIR/outputs/network-discovery.txt"

DOT="$REPO_DIR/outputs/network-graph.dot"
PNG="$REPO_DIR/outputs/network-graph.png"

echo "digraph homelab {" > "$DOT"
echo "rankdir=LR;" >> "$DOT"

echo "node [shape=box, style=rounded];" >> "$DOT"

ACTIVE_IPS=$(grep "Nmap scan report for" "$SCAN" 2>/dev/null | awk '{print $5}')

# draw device nodes
tail -n +2 "$DEVICES" | while IFS=',' read id label
do
    style="rounded"
    ip=$(echo "$label" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')

    if [ -n "$ip" ]; then
        if ! echo "$ACTIVE_IPS" | grep -q "$ip"; then
            style="rounded,dashed"
        fi
    fi

    echo "$id [label=\"$label\", style=\"$style\"];" >> "$DOT"
done

# draw service nodes
echo "node [shape=oval, style=filled, fillcolor=lightgray];" >> "$DOT"

tail -n +2 "$SERVICES" | while IFS=',' read id label
do
    echo "$id [label=\"$label\"];" >> "$DOT"
done

# draw connections
tail -n +2 "$LINKS" | while IFS=',' read from to
do
    echo "$from -> $to;" >> "$DOT"
done

echo "}" >> "$DOT"

dot -Tpng "$DOT" -o "$PNG"

echo "Graph updated:"
echo "$PNG"
