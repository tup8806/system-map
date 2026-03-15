#!/usr/bin/env bash
set -euo pipefail

BASE="${HOME}/system-map"
OUT="${BASE}/outputs"

mkdir -p "${OUT}"

{
  echo "### Hardware"
  lscpu 2>/dev/null || true
  echo
  lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT,MODEL 2>/dev/null || true
} > "${OUT}/hardware.txt"

{
  echo "### Network"
  ip -brief address 2>/dev/null || true
  echo
  ip route 2>/dev/null || true
} > "${OUT}/network.txt"

{
  echo "### Running services"
  docker ps 2>/dev/null || echo "Docker not available"
} > "${OUT}/services.txt"

{
  echo "### Storage"
  df -h 2>/dev/null || true
} > "${OUT}/storage.txt"
