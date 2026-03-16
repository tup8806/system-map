#!/bin/bash
set -e

REPO="$HOME/system-map"

echo "=== Nightly system map run ==="
echo "Time: $(date)"
echo ""

echo "Collecting system information..."
$REPO/scripts/collect-system-info.sh || true
$REPO/scripts/export-hardware-inventory.sh || true
$REPO/scripts/export-software-inventory.sh || true
$REPO/scripts/export-disk-usage.sh || true
$REPO/scripts/export-configs.sh || true

echo ""
echo "Capturing network state..."
$REPO/scripts/capture-network.sh || true
$REPO/scripts/network-discovery.sh || true

echo ""
echo "Generating reports..."
$REPO/scripts/generate-system-summary.sh || true
$REPO/scripts/generate-lab-status.sh || true
$REPO/scripts/generate-network-diagram.sh || true
$REPO/scripts/generate-network-graph.sh || true

echo ""
echo "Detecting unknown devices..."
$REPO/scripts/detect-new-devices.sh || true

echo ""
echo "Rebuilding system index..."
$REPO/scripts/build-system-index.sh || true

echo ""
echo "Checking for system drift..."
$REPO/scripts/check-drift.sh || true

echo ""
echo "Creating git snapshot..."
cd "$REPO"

git add outputs/system-index.json \
        outputs/drift-report.txt \
        outputs/new-devices.txt \
        outputs/lab-status.md \
        outputs/system-summary.md \
        outputs/network-map.png \
        outputs/network-graph.png || true

git commit -m "Automated nightly system snapshot $(date)" || true

echo ""
echo "Nightly run complete."
