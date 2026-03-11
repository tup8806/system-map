#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs"
CFG="$BASE/configs"

mkdir -p "$OUT"
mkdir -p "$CFG/bash" "$CFG/ssh" "$CFG/systemd-user" "$CFG/autostart"

echo "Collecting system info..."

hostnamectl > "$OUT/system-info.txt" 2>/dev/null || true
uname -a >> "$OUT/system-info.txt" 2>/dev/null || true
lsb_release -a > "$OUT/os-release.txt" 2>/dev/null || cat /etc/os-release > "$OUT/os-release.txt" 2>/dev/null || true

lscpu > "$OUT/cpu.txt" 2>/dev/null || true
free -h > "$OUT/memory.txt" 2>/dev/null || true
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT,MODEL > "$OUT/storage.txt" 2>/dev/null || true
ip addr > "$OUT/network.txt" 2>/dev/null || true
ip route >> "$OUT/network.txt" 2>/dev/null || true
ss -tulpn > "$OUT/listening-ports.txt" 2>/dev/null || true

systemctl list-unit-files --type=service > "$OUT/services-system.txt" 2>/dev/null || true
systemctl --user list-unit-files --type=service > "$OUT/services-user.txt" 2>/dev/null || true

apt-mark showmanual > "$OUT/manual-packages.txt" 2>/dev/null || true
dpkg -l > "$OUT/all-packages.txt" 2>/dev/null || true

flatpak list > "$OUT/flatpaks.txt" 2>/dev/null || true
snap list > "$OUT/snaps.txt" 2>/dev/null || true

docker ps -a > "$OUT/docker-containers.txt" 2>/dev/null || true
docker images > "$OUT/docker-images.txt" 2>/dev/null || true

cp "$HOME/.bashrc" "$CFG/bash/" 2>/dev/null || true
cp "$HOME/.profile" "$CFG/bash/" 2>/dev/null || true
cp "$HOME/.bash_aliases" "$CFG/bash/" 2>/dev/null || true
cp "$HOME/.ssh/config" "$CFG/ssh/" 2>/dev/null || true
cp -r "$HOME/.config/systemd/user" "$CFG/systemd-user/" 2>/dev/null || true
cp -r "$HOME/.config/autostart" "$CFG/autostart/" 2>/dev/null || true

echo "Done."
