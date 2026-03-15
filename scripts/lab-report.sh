#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo
echo "==============================="
echo " HOME LAB STATUS REPORT"
echo "==============================="
echo

echo "Server:"
hostname
echo

echo "System uptime:"
uptime
echo

echo "Disk usage:"
df -h | head -n 5
echo

echo "Docker containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo

echo "Recent network devices:"
grep "Nmap scan report for" "$REPO_DIR/outputs/network-discovery.txt" | awk '{print $5}'
echo

echo "Unknown devices detected:"
cat "$REPO_DIR/outputs/new-devices.txt"
echo

echo "==============================="
echo
