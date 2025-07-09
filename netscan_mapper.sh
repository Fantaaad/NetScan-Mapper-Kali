#!/bin/bash

# Usage: ./netscan_mapper.sh <network_range>
# Example: ./netscan_mapper.sh 10.10.10.0/24

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <network_range>"
    exit 1
fi

RANGE=$1
DATE=$(date +%Y-%m-%d)
CSV="netscan_${DATE}.csv"

echo "IP,OpenPorts,Services" > "$CSV"

echo "[+] Scanning network $RANGE..."
nmap -sS -Pn -p- --min-rate 500 -T4 "$RANGE" -oG scan_results.gnmap > /dev/null

cat scan_results.gnmap | grep "Ports:" | while read line; do
    IP=$(echo $line | awk '{print $2}')
    PORTS=$(echo $line | grep -oP '\d+/open' | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//')
    SRVS=$(nmap -sV -Pn -p "$PORTS" "$IP" | grep -E '^[0-9]+' | awk '{print $3}' | tr '\n' ',' | sed 's/,$//')
    echo "$IP,${PORTS:-None},${SRVS:-None}" >> "$CSV"
    echo "[+] Logged $IP with ports: ${PORTS:-None}"
done

rm scan_results.gnmap

echo "[+] Generating network graph..."
python3 generate_netscan_graph.py "$CSV"

echo "[+] Scan complete. CSV: $CSV | Graph: PNG generated."

