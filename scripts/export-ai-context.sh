#!/bin/bash
set -e

BASE="$HOME/system-map"

echo "# System Map Context"
echo
echo "Updated: $(date)"
echo

echo "## Latest Commit"
git -C "$BASE" log -1 --oneline 2>/dev/null || echo "No git commit found"
echo

echo "## Network"
cat "$BASE/outputs/network.txt" 2>/dev/null || echo "No network snapshot"
echo

echo "## Storage"
cat "$BASE/outputs/storage.txt" 2>/dev/null || echo "No storage snapshot"
echo

echo "## Local Services"
cat "$BASE/outputs/services.txt" 2>/dev/null || echo "No local services snapshot"
echo

echo "## Server Docker Containers"
cat "$BASE/outputs/server/docker-containers.txt" 2>/dev/null || echo "No docker container snapshot"
echo

echo "## Server Running Services"
cat "$BASE/outputs/server/running-services.txt" 2>/dev/null || echo "No server service snapshot"
echo

echo "## Server Storage"
cat "$BASE/outputs/server/storage.txt" 2>/dev/null || echo "No server storage snapshot"
echo
echo
echo "## Hardware Documentation"
echo "- notes/hardware/overview.md"
echo "- notes/hardware/toughbook.md"
echo "- notes/hardware/secondary-compute.md"
echo "- notes/hardware/embedded-radio.md"
echo "- notes/hardware/server.md"
echo
echo "## Detailed Inventory Outputs"
echo "- outputs/hardware/uname.txt"
echo "- outputs/hardware/lscpu.txt"
echo "- outputs/hardware/lsblk.txt"
echo "- outputs/hardware/lspci.txt"
echo "- outputs/hardware/lsusb.txt"
echo "- outputs/hardware/rfkill.txt"
echo "- outputs/hardware/nmcli-device-status.txt"
echo "- outputs/hardware/nmcli-active-connections.txt"
echo "- outputs/hardware/bluetooth-controllers.txt"
echo "- outputs/hardware/dmidecode-system.txt"
echo "- outputs/hardware/dmidecode-bios.txt"
echo "- outputs/hardware/dmidecode-baseboard.txt"
echo "- outputs/hardware/dmidecode-memory.txt"
echo "- outputs/software/dpkg-packages.txt"
echo "- outputs/software/apt-manual.txt"
echo "- outputs/software/systemd-unit-files.txt"
echo "- outputs/software/systemd-running-services.txt"
echo "- outputs/software/docker-ps-a.txt"
echo "- outputs/software/snap-list.txt"
echo "- outputs/software/pip3-freeze.txt"
echo "- outputs/software/npm-global.txt"
echo
echo "## Configuration Snapshots"
echo "- outputs/configs/summaries/export-configs-summary.txt"
echo "- outputs/configs/user-config/"
echo "- outputs/configs/system/"
echo "- outputs/configs/network/"
echo "- outputs/configs/services/"
echo "- outputs/configs/ssh/"
