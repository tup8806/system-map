#!/usr/bin/env bash
set -euo pipefail

BASE="${HOME}/system-map"

echo "# System Map Context"
echo
echo "Updated: $(date)"
echo

if git -C "${BASE}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "## Latest Commit"
  git -C "${BASE}" log -1 --oneline 2>/dev/null || true
  echo
fi

echo "## Core Documentation"
echo "- README.md"
echo "- AI_README.md"
echo "- INVENTORY.md"
echo "- notes/lab-architecture.md"
echo "- notes/machine-roles.md"
echo "- notes/network-topology.md"
echo "- notes/server-overview.md"
echo "- notes/server-purpose.md"
echo "- notes/server-services.md"
echo "- notes/storage-layout.md"
echo "- notes/toughbook-purpose.md"
echo "- notes/hardware/toughbook.md"
echo "- notes/hardware/server.md"
echo

for file in \
  outputs/network.txt \
  outputs/hardware.txt \
  outputs/services.txt \
  outputs/storage.txt
do
  if [ -f "${BASE}/${file}" ]; then
    echo "## $(basename "${file}")"
    sed -n '1,80p' "${BASE}/${file}"
    echo
  fi
done
