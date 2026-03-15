# Machine Roles

This file defines which machine is responsible for generating which parts of the repository.

## Toughbook CF-31
Purpose:
- admin workstation
- network scanner
- diagram generator
- repo editing

This machine is responsible for generating:
- outputs/network-scan.txt
- outputs/network-graph.png
- outputs/device-inventory.md
- configs/network-devices.csv
- configs/network-links.csv

This machine should NOT overwrite:
- configs/server-services.csv

## Dell Optiplex 7010 Server
Purpose:
- service host
- Docker application host
- media and lab services

This machine is responsible for generating:
- configs/server-services.csv

This machine should NOT overwrite:
- network scans
- topology diagrams
- device inventory generated from the Toughbook

## Shared Git Workflow
Before editing:
git pull --rebase origin main

After editing:
git add .
git commit -m "Describe change"
git push
