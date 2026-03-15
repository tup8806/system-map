#!/bin/bash

OUT="../outputs/system-summary.md"

echo "# System Summary" > "$OUT"
echo "" >> "$OUT"

echo "Generated: $(date)" >> "$OUT"
echo "" >> "$OUT"

echo "## Hostname" >> "$OUT"
hostname >> "$OUT"
echo "" >> "$OUT"

echo "## System Uptime" >> "$OUT"
uptime >> "$OUT"
echo "" >> "$OUT"

echo "## Disk Usage" >> "$OUT"
df -h >> "$OUT"
echo "" >> "$OUT"

echo "## Memory Usage" >> "$OUT"
free -h >> "$OUT"
echo "" >> "$OUT"

echo "## Network Interfaces" >> "$OUT"
ip -brief address >> "$OUT"
echo "" >> "$OUT"

echo "## Docker Containers" >> "$OUT"
docker ps >> "$OUT" 2>/dev/null || echo "Docker not available" >> "$OUT"
echo "" >> "$OUT"

echo "## Listening Ports" >> "$OUT"
ss -ltnp >> "$OUT"
echo "" >> "$OUT"

echo "## Top CPU Processes" >> "$OUT"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -10 >> "$OUT"
echo "" >> "$OUT"
