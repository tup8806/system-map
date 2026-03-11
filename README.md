# System Map

This repository documents the Toughbook system, its purpose, important software, selected configs, and generated system snapshots.

## Purpose
- record installed software and enabled services
- back up important user config files
- track system changes over time
- make troubleshooting easier
- maintain a repeatable system mapping habit

## This machine
The Toughbook is used as:
- a portable Debian workstation
- a management terminal for the home server
- a network diagnostics laptop
- a hardware and power-tuning platform
- a portable AI command station

## Main folders
- `scripts/` -> collection and backup scripts
- `outputs/` -> generated system information
- `configs/` -> copied user config files
- `notes/` -> human-readable notes

## Key files
- `INVENTORY.md` -> summary of the Toughbook
- `CHANGES.md` -> dated record of major changes
- `notes/toughbook-purpose.md` -> explanation of the Toughbook's role

## Workflow
The normal update flow is:

1. run the mapping script
2. review changed outputs
3. update notes if needed
4. commit the snapshot to git
