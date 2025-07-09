#!/usr/bin/env python3

import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
import sys
import os

if len(sys.argv) != 2:
    print("Usage: python3 generate_netscan_graph.py <csv_file>")
    exit(1)

csv_file = sys.argv[1]
if not os.path.exists(csv_file):
    print(f"[!] CSV file {csv_file} not found.")
    exit(1)

df = pd.read_csv(csv_file)

G = nx.Graph()

for idx, row in df.iterrows():
    ip = row['IP']
    ports = str(row['OpenPorts'])
    label = f"{ip}\n{ports}"
    port_count = len(str(ports).split(',')) if ports != 'None' else 0

    color = 'green'
    if port_count > 5:
        color = 'orange'
    if port_count > 10:
        color = 'red'

    G.add_node(label, color=color)

colors = [G.nodes[n]['color'] for n in G.nodes()]

plt.figure(figsize=(12,8))
pos = nx.spring_layout(G, seed=42)
nx.draw(G, pos, with_labels=True, node_color=colors, node_size=1000, font_size=8)
plt.title("Network Map - Open Ports per Host")
plt.tight_layout()

output_png = csv_file.replace('.csv', '.png')
plt.savefig(output_png)
print(f"[+] Graph saved as {output_png}")
