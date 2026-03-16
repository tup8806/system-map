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
| Jellyfin metadata/watch history | `/srv/appdata/jellyfin` | _(document your backup status here)_ |
| Uptime Kuma monitors | `/srv/appdata/uptime-kuma` | _(document your backup status here)_ |
| Tdarr config | `/your/config/tdarr` | _(document your backup status here)_ |
| Portainer data | Docker volume `portainer_data` | _(document your backup status here)_ |
| Compose files | `configs/compose/` | Yes — in Git |
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

Set a static IP:
```bash
nano /etc/network/interfaces
```

Make it look like this (run `ip link` if `enp2s0` does not exist):
```
auto enp2s0
iface enp2s0 inet static
    address 192.168.4.76
    netmask 255.255.252.0
    gateway 192.168.4.1
    dns-nameservers 1.1.1.1 8.8.8.8
```

Save with Ctrl+O, Enter, Ctrl+X. Then:
```bash
systemctl restart networking
ip addr show
ping 192.168.4.1
```

---

### Step 2 — Install base packages
```bash
apt update && apt upgrade -y
apt install -y git curl wget htop net-tools nmap samba ufw sudo ca-certificates gnupg lsb-release
```

Add your user to sudo:
```bash
usermod -aG sudo tup
```

---

### Step 3 — Install Docker

Paste this whole block at once:
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
usermod -aG docker tup
systemctl enable docker
systemctl start docker
```

Verify:
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

### Step 5 — Create appdata and config directories
```bash
mkdir -p /srv/appdata/jellyfin
mkdir -p /srv/appdata/uptime-kuma
mkdir -p /your/config/tdarr/server
mkdir -p /your/config/tdarr/logs
mkdir -p /tmp/tdarr
mkdir -p /srv/media
```

> If you have backups of `/srv/appdata` and `/your/config/tdarr`, restore them now before starting containers. That preserves Jellyfin library metadata, watch history, and Tdarr settings.

---

### Step 6 — Start Portainer first
```bash
docker run -d \
  --name portainer \
  --restart=always \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```

Verify: `docker ps`

Open in browser: `http://192.168.4.76:9000` and set your admin password.

---

### Step 7 — Start Uptime Kuma
```bash
docker run -d \
  --name uptime-kuma \
  --restart=unless-stopped \
  -p 3001:3001 \
  -v /srv/appdata/uptime-kuma:/app/data \
  louislam/uptime-kuma:1
```

Open in browser: `http://192.168.4.76:3001`

---

### Step 8 — Start Jellyfin
```bash
docker run -d \
  --name jellyfin \
  --restart=unless-stopped \
  --user 1000:1000 \
  -p 8096:8096 \
  -v /srv/appdata/jellyfin:/config \
  -v /srv/media:/media \
  jellyfin/jellyfin:latest
```

Open in browser: `http://192.168.4.76:8096`

> If you restored your `/srv/appdata/jellyfin` backup, your libraries and watch history will be intact. If starting fresh, go through the setup wizard and point your library at `/media`.

---

### Step 9 — Start Tdarr

Tdarr is managed via docker compose. The compose file is saved in this repo at `configs/compose/docker-compose.yml`.
```bash
cd ~/system-map/configs/compose
docker compose up -d
```

Or if you want to run it manually without compose:
```bash
docker run -d \
  --name tdarr \
  --restart=unless-stopped \
  -p 8265:8265 \
  -p 8266:8266 \
  -e TZ=America/Chicago \
  -e PUID=1000 \
  -e PGID=1000 \
  -e UMASK_SET=002 \
  -e serverIP=0.0.0.0 \
  -e serverPort=8266 \
  -e webUIPort=8265 \
  -e internalNode=true \
  -e nodeName=MyInternalNode \
  -v /your/config/tdarr:/app/configs \
  -v /your/config/tdarr/server:/app/server \
  -v /your/config/tdarr/logs:/app/logs \
  -v /srv/media:/media \
  -v /tmp/tdarr:/temp \
  ghcr.io/haveagitgat/tdarr:latest
```

Open in browser: `http://192.168.4.76:8265`

---

### Step 10 — Configure Samba
```bash
cp ~/system-map/configs/smb.conf /etc/samba/smb.conf
smbpasswd -a tup
systemctl restart smbd nmbd
systemctl enable smbd nmbd
```

---

### Step 11 — Configure firewall
```bash
ufw allow ssh
ufw allow samba
ufw allow 8096
ufw allow 8265
ufw allow 8266
ufw allow 9000
ufw allow 3001
ufw enable
ufw status
```

---

### Step 12 — Verify everything

- [ ] SSH from Toughbook: `ssh tup@192.168.4.76`
- [ ] Portainer: `http://192.168.4.76:9000`
- [ ] Jellyfin: `http://192.168.4.76:8096`
- [ ] Uptime Kuma: `http://192.168.4.76:3001`
- [ ] Tdarr: `http://192.168.4.76:8265`
- [ ] Samba share visible from Toughbook
- [ ] All containers show healthy in `docker ps`

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

- [ ] SSH into server: `ssh tup@192.168.4.76`
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
| Media backup/restore | Document where media lives and how to restore |
| RetroPie ROM restore | Document source and restore steps |
| OpenClaw setup | Not documented anywhere yet |
| Appdata backup procedure | `/srv/appdata` should be backed up somewhere |
| Tdarr config backup | `/your/config/tdarr` should be backed up somewhere |

---

_This runbook is only useful if it is accurate. Update it when you change the system._
