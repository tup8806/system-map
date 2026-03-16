# Lab Recovery Runbook

This document is the step-by-step guide for rebuilding the lab from scratch.

**Keep this file accurate. If you change the system, update this file in the same commit.**

---

## Before You Start

### What you need

- A second machine to read this from (phone works)
- USB drive with Debian netinstall ISO (64-bit)
- Access to this repository
- Physical access to the machine being rebuilt
- Network access (router must be up)

### What gets lost in a full rebuild

| Data | Location | Backed up? |
|------|----------|-----------|
| Media library | `/srv/media` | _(document your backup status here)_ |
| RetroPie ROMs | `/srv/retropie` | _(document your backup status here)_ |
| Jellyfin metadata/watch history | Docker volume | _(document your backup status here)_ |
| Configs tracked in this repo | `configs/` | Yes — in Git |
| This documentation | GitHub | Yes — in Git |

---

## Part 1 — Rebuild the Server (Dell Optiplex 7010)

### Step 1 — Install Debian

1. Boot from USB (press **F12** at the Dell logo for the boot menu)
2. Choose **Debian Stable, 64-bit, netinstall**
3. During install:
   - Hostname: `server`
   - No desktop environment
   - Install SSH server: YES
   - Install standard system utilities: YES
4. After install, log in as root

Set a static IP so the server is always at the same address:
```bash
nano /etc/network/interfaces
```

Make it look like this (replace `enp2s0` if your interface name is different):
```
auto enp2s0
iface enp2s0 inet static
    address 192.168.4.76
    netmask 255.255.252.0
    gateway 192.168.4.1
    dns-nameservers 1.1.1.1 8.8.8.8
```

Save with Ctrl+O, Enter, Ctrl+X. Then restart networking:
```bash
systemctl restart networking
ip addr show
ping 192.168.4.1
```

> If `enp2s0` does not exist, run `ip link` to see your actual interface name.

---

### Step 2 — Install base packages
```bash
apt update && apt upgrade -y
apt install -y git curl wget htop net-tools nmap samba ufw sudo ca-certificates gnupg lsb-release
```

Add your user to sudo (replace `yourusername`):
```bash
usermod -aG sudo yourusername
```

---

### Step 3 — Install Docker

Copy and paste this whole block at once:
```bash
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
usermod -aG docker yourusername
systemctl enable docker
systemctl start docker
```

Verify Docker works:
```bash
docker run hello-world
```

---

### Step 4 — Clone this repo onto the server
```bash
cd ~
git clone https://github.com/tup8806/system-map.git
cd system-map
```

---

### Step 5 — Restore configs
```bash
cp configs/smb.conf /etc/samba/smb.conf
systemctl restart smbd
```

> Add more lines here as you track more configs in the repo.

---

### Step 6 — Spin up Docker services

Bring them up in this order:
```bash
# 1. Portainer
docker run -d \
    --name portainer \
    --restart=always \
    -p 8000:8000 -p 9443:9443 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# 2-6: Jellyfin, Tdarr, Uptime Kuma, OpenClaw, EmulationStation
# Add your actual run commands here from notes/server-services.md
```

Check everything is running:
```bash
docker ps
```

---

### Step 7 — Configure Samba
```bash
smbpasswd -a yourusername
systemctl restart smbd nmbd
systemctl enable smbd nmbd
```

Test from the Toughbook:
```bash
smbclient -L 192.168.4.76 -U yourusername
```

---

### Step 8 — Configure firewall
```bash
ufw allow ssh
ufw allow samba
ufw allow 8096
ufw allow 8265
ufw allow 9443
ufw allow 3001
ufw enable
ufw status
```

---

### Step 9 — Verify everything

- [ ] SSH from Toughbook: `ssh user@192.168.4.76`
- [ ] Jellyfin: `http://192.168.4.76:8096`
- [ ] Portainer: `https://192.168.4.76:9443`
- [ ] Uptime Kuma: `http://192.168.4.76:3001`
- [ ] Tdarr: `http://192.168.4.76:8265`
- [ ] Samba share visible from Toughbook
- [ ] OpenClaw responding
- [ ] EmulationStation launches

---

## Part 2 — Rebuild the Toughbook (Panasonic CF-31)

### Step 1 — Install Debian XFCE

1. Boot from USB
2. Choose **Debian Stable, 64-bit, graphical install**
3. Select **XFCE** desktop during task selection
4. Hostname: `toughbook`

After install, set IP to `192.168.4.82` via NetworkManager (the network icon in the taskbar).

---

### Step 2 — Install packages
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget nmap net-tools htop smbclient ssh
```

---

### Step 3 — Clone this repo
```bash
cd ~
git clone https://github.com/tup8806/system-map.git
cd system-map
```

---

### Step 4 — Restore script permissions
```bash
chmod +x scripts/*.sh
```

---

### Step 5 — Verify Toughbook roles

- [ ] SSH into server: `ssh user@192.168.4.76`
- [ ] Samba shares accessible
- [ ] Scripts run without errors
- [ ] Git push works: `git push`
- [ ] Router reachable: `ping 192.168.4.1`

---

## Part 3 — After Either Rebuild
```bash
cd ~/system-map
./scripts/stamp-outputs.sh
git add -A
git commit -m "post-rebuild: server rebuilt on $(date +%Y-%m-%d)"
git push
```

---

## Known Gaps

| Gap | Notes |
|-----|-------|
| Docker compose files not tracked | Store in `configs/` and link here |
| Media backup/restore | Document where media lives and how to restore |
| RetroPie ROM restore | Document source and restore steps |
| OpenClaw setup | Not documented anywhere yet |
| Exact Samba share definitions | Should be in `configs/smb.conf` |
| Jellyfin library re-scan after restore | Add steps once tested |

---

_This runbook is only useful if it is accurate. Update it when you change the system._
