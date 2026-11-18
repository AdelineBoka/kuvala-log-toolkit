#!/bin/bash
echo "Kuvala Shipment Summary"
echo "Delayed shipments:"
grep -c delayed data/log.csv
echo "Shipments per driver:"
tail -n +2 data/log.csv | cut -d',' -f7 | sort | uniq -c | sort -rn
