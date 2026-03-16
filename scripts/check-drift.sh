#!/bin/bash
set -e

REPO=~/system-map

BASELINE="$REPO/configs"
OUTPUT="$REPO/outputs"
REPORT="$REPO/outputs/drift-report.txt"

echo "System Drift Report" > "$REPORT"
echo "Generated: $(date)" >> "$REPORT"
echo "" >> "$REPORT"

echo "Checking for unknown devices..." >> "$REPORT"
cat "$OUTPUT/new-devices.txt" >> "$REPORT"
echo "" >> "$REPORT"

echo "Checking open ports..." >> "$REPORT"
diff "$BASELINE/server-services.csv" "$OUTPUT/listening-ports.txt" >> "$REPORT" || true
echo "" >> "$REPORT"

echo "Checking docker containers..." >> "$REPORT"
diff "$OUTPUT/docker-containers.txt" "$OUTPUT/docker-images.txt" >> "$REPORT" || true
echo "" >> "$REPORT"

echo "Drift report written to:"
echo "$REPORT"
