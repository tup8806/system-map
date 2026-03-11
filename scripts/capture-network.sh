#!/bin/bash

OUT="$HOME/system-map/outputs"
mkdir -p "$OUT"

{
  echo "# Network Identity Snapshot"
  echo
  echo "Captured: $(date)"
  echo

  echo "## Hostname"
  hostname
  echo

  echo "## Full Host Info"
  hostnamectl 2>/dev/null
  echo

  echo "## Interfaces and IP Addresses"
  ip -brief address
  echo

  echo "## Default Route"
  ip route | grep default
  echo

  echo "## Full Routing Table"
  ip route
  echo

  echo "## DNS Resolvers"
  cat /etc/resolv.conf
  echo

  echo "## Wi-Fi Connection"
  nmcli -t -f ACTIVE,SSID dev wifi 2>/dev/null | grep '^yes' || echo "No active Wi-Fi SSID found"
  echo

  echo "## NetworkManager Devices"
  nmcli device status 2>/dev/null
  echo

} > "$OUT/network-identity.txt"

echo "Saved network identity to $OUT/network-identity.txt"
