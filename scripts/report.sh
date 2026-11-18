#!/bin/bash
FILE="${1:-data/log.csv}"

if [ ! -f "$FILE" ]; then
  echo "Error: file not found: $FILE" >&2
  exit 1
fi
echo "Kuvala Shipment Summary"
echo "Delayed shipments:"
grep -c delayed "$FILE"
echo "Shipments per driver:"
tail -n +2 "$FILE" | cut -d',' -f7 | sort | uniq -c | sort -rn
echo "Total weight (kg):"
awk -F',' 'NR>1 {sum += $6} END {print sum}' "$FILE"
echo "Average weight (kg):"
awk -F',' 'NR>1 {sum += $6; n++} END {print sum/n}' "$FILE"
echo "Weight per driver (kg):"
awk -F',' 'NR>1 {total[$7] += $6} END {for (d in total) print d, total[d]}' "$FILE" | sort -k2 -rn

