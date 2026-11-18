#!/bin/bash
echo "Kuvala Shipment Summary"
echo "Delayed shipments:"
grep -c delayed data/log.csv
echo "Shipments per driver:"
tail -n +2 data/log.csv | cut -d',' -f7 | sort | uniq -c | sort -rn
echo "Total weight (kg):"
awk -F',' 'NR>1 {sum += $6} END {print sum}' data/log.csv
echo "Average weight (kg):"
awk -F',' 'NR>1 {sum += $6; n++} END {print sum/n}' data/log.csv
echo "Weight per driver (kg):"
awk -F',' 'NR>1 {total[$7] += $6} END {for (d in total) print d, total[d]}' data/log.csv | sort -k2 -rn
