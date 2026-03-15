#!/bin/bash
set -e

BASE="$HOME/system-map"
OUT="$BASE/outputs/configs"
HOSTNAME="$(hostname -s)"

mkdir -p "$OUT/user-config"
mkdir -p "$OUT/system"
mkdir -p "$OUT/network"
mkdir -p "$OUT/services"
mkdir -p "$OUT/ssh"
mkdir -p "$OUT/summaries"

echo "Exporting config snapshots to $OUT"

# ----------------------------
# User-level config
# ----------------------------

mkdir -p "$OUT/user-config/home-config"
cp -a "$HOME/.config/autostart" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/gqrx" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/gtk-3.0" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/htop" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/libreoffice" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/pavucontrol.ini" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/QtProject.conf" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/quodlibet" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/Thunar" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/user-dirs.dirs" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/user-dirs.locale" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/xarchiver" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.config/xfce4" "$OUT/user-config/home-config/" 2>/dev/null || true
cp -a "$HOME/.bashrc" "$OUT/user-config/" 2>/dev/null || true
cp -a "$HOME/.profile" "$OUT/user-config/" 2>/dev/null || true
cp -a "$HOME/.xsessionrc" "$OUT/user-config/" 2>/dev/null || true
cp -a "$HOME/.xinitrc" "$OUT/user-config/" 2>/dev/null || true
cp -a "$HOME/.gitconfig" "$OUT/user-config/" 2>/dev/null || true
cp -a "$HOME/.ssh/config" "$OUT/user-config/ssh-config-user" 2>/dev/null || true

# ----------------------------
# System-level config
# ----------------------------

sudo cp -a /etc/fstab "$OUT/system/" 2>/dev/null || true
sudo cp -a /etc/hostname "$OUT/system/" 2>/dev/null || true
sudo cp -a /etc/hosts "$OUT/system/" 2>/dev/null || true
sudo cp -a /etc/default "$OUT/system/etc-default" 2>/dev/null || true
sudo cp -a /etc/environment "$OUT/system/" 2>/dev/null || true
sudo cp -a /etc/resolv.conf "$OUT/system/" 2>/dev/null || true

# ----------------------------
# NetworkManager and networking
# ----------------------------

sudo mkdir -p "$OUT/network/NetworkManager"
sudo cp -a /etc/NetworkManager/NetworkManager.conf "$OUT/network/NetworkManager/" 2>/dev/null || true
sudo cp -a /etc/NetworkManager/conf.d "$OUT/network/NetworkManager/" 2>/dev/null || true
sudo cp -a /etc/NetworkManager/dispatcher.d "$OUT/network/NetworkManager/" 2>/dev/null || true
sudo cp -a /etc/NetworkManager/dnsmasq.d "$OUT/network/NetworkManager/" 2>/dev/null || true
sudo cp -a /etc/NetworkManager/dnsmasq-shared.d "$OUT/network/NetworkManager/" 2>/dev/null || true
sudo cp -a /etc/network "$OUT/network/etc-network" 2>/dev/null || true
nmcli connection show > "$OUT/network/nmcli-connections.txt" 2>/dev/null || true
nmcli device show > "$OUT/network/nmcli-device-show.txt" 2>/dev/null || true

# ----------------------------
# SSH
# ----------------------------

sudo mkdir -p "$OUT/ssh/etc-ssh"
sudo cp -a /etc/ssh/ssh_config "$OUT/ssh/etc-ssh/" 2>/dev/null || true
sudo cp -a /etc/ssh/sshd_config "$OUT/ssh/etc-ssh/" 2>/dev/null || true
sudo cp -a /etc/ssh/ssh_config.d "$OUT/ssh/etc-ssh/" 2>/dev/null || true
sudo cp -a /etc/ssh/sshd_config.d "$OUT/ssh/etc-ssh/" 2>/dev/null || true
sudo cp -a /etc/ssh/moduli "$OUT/ssh/etc-ssh/" 2>/dev/null || true

# ----------------------------
# Systemd services
# ----------------------------

sudo cp -a /etc/systemd/system "$OUT/services/etc-systemd-system" 2>/dev/null || true


systemctl list-unit-files --type=service > "$OUT/services/systemd-unit-files.txt" 2>/dev/null || true
systemctl list-units --type=service --all > "$OUT/services/systemd-units-all.txt" 2>/dev/null || true
systemctl --user list-unit-files --type=service > "$OUT/services/user-systemd-unit-files.txt" 2>/dev/null || true
systemctl --user list-units --type=service --all > "$OUT/services/user-systemd-units-all.txt" 2>/dev/null || true

# ----------------------------
# Package source configs
# ----------------------------

sudo mkdir -p "$OUT/system/etc-apt"
sudo cp -a /etc/apt/apt.conf.d "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/keyrings "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/listchanges.conf "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/listchanges.conf.d "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/preferences.d "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/sources.list "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/sources.list.d "$OUT/system/etc-apt/" 2>/dev/null || true
sudo cp -a /etc/apt/trusted.gpg.d "$OUT/system/etc-apt/" 2>/dev/null || true
# ----------------------------
# Important summaries
# ----------------------------

{
  echo "Hostname: $HOSTNAME"
  echo "Exported: $(date)"
  echo
  echo "User config captured from:"
  echo "- $HOME/.config"
  echo "- $HOME/.bashrc"
  echo "- $HOME/.profile"
  echo "- $HOME/.gitconfig"
  echo
  echo "System config captured from:"
  echo "- /etc/fstab"
  echo "- /etc/hostname"
  echo "- /etc/hosts"
  echo "- /etc/default"
  echo "- /etc/environment"
  echo "- /etc/resolv.conf"
  echo "- /etc/NetworkManager"
  echo "- /etc/network"
  echo "- /etc/ssh"
  echo "- /etc/systemd/system"
  echo "- /etc/apt"
  echo
  echo "Notes:"
  echo "- Some files may be absent depending on the system."
  echo "- Some copied configs may contain secrets and should be reviewed before pushing."
} > "$OUT/summaries/export-configs-summary.txt"

echo "Done."
