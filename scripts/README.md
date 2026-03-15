# Scripts Directory

This directory contains automation used by the system-map project.

The scripts fall into a few categories:

## Nightly automation

nightly-toughbook.sh  
Manual workflow run from the desktop launcher.  
Runs scans, generates reports, opens CHANGES.md for notes, and commits the snapshot.

nightly-toughbook-auto.sh  
Automatic Toughbook snapshot used by the 3 AM systemd timer.

nightly-server.sh  
Server-side nightly automation that exports Docker services and commits the results.

nightly-oneclick.sh  
Legacy helper script used earlier in the project.

nightly.sh  
Older nightly script kept for reference.

---

## Network collection

capture-network.sh  
Captures the Toughbook’s own network configuration and identity.

network-discovery.sh  
Scans the subnet for devices using nmap and arp-scan.

detect-new-devices.sh  
Compares scans and identifies new devices appearing on the network.

---

## Inventory generation

generate-device-inventory.sh  
Builds the device inventory documentation.

generate-network-graph.sh  
Generates a visual network graph.

generate-network-diagram.sh  
Earlier version of the topology generator.

generate-lab-dashboard.sh  
Creates the lab status dashboard.

generate-system-summary.sh  
Produces a high-level summary of the system state.

---

## Exporters

export-ai-context.sh  
Exports environment context for AI tools.

export-configs.sh  
Exports configuration files from the system.

export-disk-usage.sh  
Captures disk usage statistics.

export-docker-services.sh  
Exports Docker container information from the server.

export-hardware-inventory.sh  
Collects hardware details for documentation.

export-software-inventory.sh  
Lists installed software packages.

---

## System state logging

collect-system-info.sh  
Captures general system information.

log-lab-state.sh  
Records a snapshot of the lab’s operational state.

update-system-map.sh  
Updates the repository with current lab data.

lab-report.sh  
Generates a combined lab report.
