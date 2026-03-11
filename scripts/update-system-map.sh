#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs"
CFG="$BASE/configs"

mkdir -p "$OUT"
mkdir -p "$CFG/bash" "$CFG/ssh" "$CFG/systemd-user" "$CFG/autostart"

echo "Collecting system info..."

{
  echo "# Hostnamectl"
  echo
  hostnamectl
  echo
  echo "# uname -a"
  echo
  uname -a
} > "$OUT/system-info.txt" 2>/dev/null || true

lsb_release -a > "$OUT/os-release.txt" 2>/dev/null || cat /etc/os-release > "$OUT/os-release.txt" 2>/dev/null || true

lscpu > "$OUT/cpu.txt" 2>/dev/null || true
free -h > "$OUT/memory.txt" 2>/dev/null || true
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT,MODEL > "$OUT/storage.txt" 2>/dev/null || true
df -h > "$OUT/filesystems.txt" 2>/dev/null || true
mount > "$OUT/mounts.txt" 2>/dev/null || true

{
  echo "# Network Identity Snapshot"
  echo
  echo "Captured: $(date)"
  echo
  echo "## Hostname"
  hostname
  hostname -I
  echo
  echo "## Interfaces and Addresses"
  ip -brief address
  echo
  echo "## Default Route"
  ip route | grep default
  echo
  echo "## Full Routing Table"
  ip route
  echo
  echo "## DNS"
  cat /etc/resolv.conf
  echo
  echo "## Active Wi-Fi"
  nmcli -t -f ACTIVE,SSID dev wifi 2>/dev/null | grep '^yes' || echo "No active Wi-Fi SSID found"
} > "$OUT/network.txt"

ss -tulpn > "$OUT/listening-ports.txt" 2>/dev/null || true
ss -tulpen > "$OUT/open-ports.txt" 2>/dev/null || true

systemctl list-unit-files --type=service > "$OUT/services-system.txt" 2>/dev/null || true
systemctl --user list-unit-files --type=service > "$OUT/services-user.txt" 2>/dev/null || true
systemctl list-units --type=service --state=running > "$OUT/running-services.txt" 2>/dev/null || true
systemctl list-timers > "$OUT/systemd-timers.txt" 2>/dev/null || true

apt-mark showmanual > "$OUT/manual-packages.txt" 2>/dev/null || true
dpkg -l > "$OUT/all-packages.txt" 2>/dev/null || true
flatpak list > "$OUT/flatpaks.txt" 2>/dev/null || true
snap list > "$OUT/snaps.txt" 2>/dev/null || true

docker ps -a > "$OUT/docker-containers.txt" 2>/dev/null || true
docker images > "$OUT/docker-images.txt" 2>/dev/null || true

crontab -l > "$OUT/user-cron.txt" 2>/dev/null || true
ls /etc/cron* -R > "$OUT/system-cron-files.txt" 2>/dev/null || true

lsmod > "$OUT/kernel-modules.txt" 2>/dev/null || true

if [ "$(id -u)" -eq 0 ]; then
  iptables -L -n > "$OUT/firewall-rules.txt" 2>/dev/null || true
else
  echo "Run as root to capture firewall rules" > "$OUT/firewall-rules.txt"
fi

cp "$HOME/.bashrc" "$CFG/bash/" 2>/dev/null || true
cp "$HOME/.profile" "$CFG/bash/" 2>/dev/null || true
cp "$HOME/.bash_aliases" "$CFG/bash/" 2>/dev/null || true
cp "$HOME/.ssh/config" "$CFG/ssh/" 2>/dev/null || true
cp -r "$HOME/.config/systemd/user/." "$CFG/systemd-user/" 2>/dev/null || true
cp -r "$HOME/.config/autostart/." "$CFG/autostart/" 2>/dev/null || true

echo "Done."
