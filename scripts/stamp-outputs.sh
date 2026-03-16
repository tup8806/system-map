#!/usr/bin/env bash
# stamp-outputs.sh — adds freshness headers to outputs/ and updates LAB_STATUS.md

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUTS_DIR="$REPO_ROOT/outputs"
LAB_STATUS="$REPO_ROOT/LAB_STATUS.md"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"
HOSTNAME_SHORT="$(hostname -s)"
DRY_RUN=false

[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

stamp_file() {
    local file="$1"
    local ext="${file##*.}"
    local stamp_line=""

    case "$ext" in
        md|html) stamp_line="<!-- generated: $TIMESTAMP | host: $HOSTNAME_SHORT -->" ;;
        *)       stamp_line="# generated: $TIMESTAMP | host: $HOSTNAME_SHORT" ;;
    esac

    if $DRY_RUN; then echo "[dry-run] would stamp: $file"; return; fi

    local tmp
    tmp="$(mktemp)"

    if grep -qE "^(<!--|#) generated:" "$file" 2>/dev/null; then
        sed "s|^.*generated:.*$|$stamp_line|" "$file" > "$tmp"
    else
        { echo "$stamp_line"; echo ""; cat "$file"; } > "$tmp"
    fi

    mv "$tmp" "$file"
    echo "  stamped: $(basename "$file")"
}

echo "==> Stamping output files..."
if [[ -d "$OUTPUTS_DIR" ]]; then
    while IFS= read -r -d '' f; do
        stamp_file "$f"
    done < <(find "$OUTPUTS_DIR" -maxdepth 2 -type f \
        ! -name ".gitkeep" ! -name "*.png" ! -name "*.jpg" ! -name "*.svg" \
        -print0)
else
    echo "  WARNING: outputs/ not found"
fi

build_freshness_table() {
    printf "| File | Last Generated | Host |\n"
    printf "|------|----------------|------|\n"
    if [[ -d "$OUTPUTS_DIR" ]]; then
        while IFS= read -r -d '' f; do
            local rel="${f#$REPO_ROOT/}"
            local stamp host
            stamp="$(grep -m1 -E "generated:" "$f" 2>/dev/null | sed 's/.*generated: //;s/ | host:.*//' || echo "unknown")"
            host="$(grep -m1 -E "generated:" "$f" 2>/dev/null | sed 's/.*host: //' | tr -d ' \n\r>' || echo "unknown")"
            printf "| \`%s\` | %s | %s |\n" "$rel" "$stamp" "$host"
        done < <(find "$OUTPUTS_DIR" -maxdepth 2 -type f \
            ! -name ".gitkeep" ! -name "*.png" ! -name "*.jpg" ! -name "*.svg" \
            -print0 | sort -z)
    fi
}

echo ""
echo "==> Updating LAB_STATUS.md..."

START_MARKER="<!-- FRESHNESS_TABLE_START -->"
END_MARKER="<!-- FRESHNESS_TABLE_END -->"
TABLE="$(build_freshness_table)"

BLOCK="${START_MARKER}
_Last updated: ${TIMESTAMP} by \`stamp-outputs.sh\` on \`${HOSTNAME_SHORT}\`_

${TABLE}
${END_MARKER}"

if $DRY_RUN; then
    echo "[dry-run] freshness table preview:"
    echo "$BLOCK"
    exit 0
fi

if [[ -f "$LAB_STATUS" ]]; then
    if grep -q "FRESHNESS_TABLE_START" "$LAB_STATUS"; then
        tmp="$(mktemp)"
        awk -v start="$START_MARKER" -v end="$END_MARKER" -v block="$BLOCK" '
            $0 == start { print block; skip=1; next }
            $0 == end   { skip=0; next }
            !skip        { print }
        ' "$LAB_STATUS" > "$tmp"
        mv "$tmp" "$LAB_STATUS"
        echo "  freshness table updated"
    else
        { echo ""; echo "---"; echo ""; echo "## Output Freshness"; echo ""; echo "$BLOCK"; } >> "$LAB_STATUS"
        echo "  freshness section appended"
    fi
else
    echo "  WARNING: LAB_STATUS.md not found"
fi

echo ""
echo "Done. Commit LAB_STATUS.md and any stamped output files."
