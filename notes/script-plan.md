# Script Plan

## Toughbook
- scan-network.sh -> writes outputs/network-scan.txt
- generate-network-graph.sh -> writes outputs/network-graph.png
- generate-device-inventory.sh -> writes outputs/device-inventory.md
- export-ai-context.sh -> writes ai-context.md
- nightly-oneclick.sh -> runs the normal nightly workflow

## Server
- export-docker-services.sh -> writes configs/server-services.csv

## Rule
Each script should have one clear job and one predictable output file.
