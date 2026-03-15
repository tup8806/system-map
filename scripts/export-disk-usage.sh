#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs"

mkdir -p "$OUT"

{
  echo "# Disk Usage Snapshot"
  echo
  echo "Captured: $(date)"
  echo
  echo "## df -h"
  df -h
  echo
  echo "## lsblk"
  lsblk
} > "$OUT/disk-usage.md"
