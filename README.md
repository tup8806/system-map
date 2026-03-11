# System Map

This repository documents the systems in my homelab, their hardware, software, roles, configs, and generated state snapshots.

## Main Systems

### Toughbook
Portable Debian workstation used for:
- server administration
- network diagnostics
- hardware testing and power tuning
- command-line AI tools

### Optiplex Server
Main home server used for:
- media storage
- Jellyfin streaming
- emulator hosting
- Docker services
- network file sharing

## Repository Structure

- `scripts/` -> automation and collection scripts
- `outputs/` -> generated system snapshots
- `outputs/server/` -> server-specific generated snapshots
- `configs/` -> copied config files
- `configs/server/` -> server-specific copied config files
- `notes/` -> human-readable notes
- `notes/hardware/` -> physical hardware documentation

## Key Files

- `INVENTORY.md` -> Toughbook summary
- `CHANGES.md` -> dated change history
- `notes/toughbook-purpose.md` -> Toughbook role
- `notes/server-purpose.md` -> server role
- `notes/server-overview.md` -> server service summary
- `notes/network-topology.md` -> network layout
- `notes/hardware/toughbook.md` -> Toughbook hardware
- `notes/hardware/server.md` -> server hardware

## Workflow

### Toughbook
- run mapping script
- review outputs
- update notes if needed
- commit snapshot to git

### Server
- run desktop launcher or nightly script
- update server-specific outputs and configs
- commit snapshot to git
