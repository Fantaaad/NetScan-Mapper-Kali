# NetScan Mapper for Pentesters (Kali Linux)

Automate **network discovery and visualization** during your pentesting practice using Kali Linux.

---

## ✨ Features

✅ Scans an entire network range to find live hosts and open ports using `nmap`.  
✅ Generates a CSV with IPs, open ports, and detected services.  
✅ Creates a visual PNG graph mapping each live host with its open ports.  
✅ Quickly understand your lab environment in HTB, TryHackMe, or your home lab.

---

## 🚩 Requirements

- Kali Linux or Linux with:
  - `bash`
  - `nmap`
  - `python3`
  - Python libraries: `pandas`, `matplotlib`, `networkx`

**Install dependencies:**
```bash
sudo apt update
sudo apt install nmap python3-pandas python3-matplotlib python3-networkx -y
```

---

## 📦 Installation

Clone the repository:
```bash
git clone https://github.com/Fantaaad/NetScan-Mapper-Kali.git
cd NetScan-Mapper-Kali
chmod +x netscan_mapper.sh
chmod +x generate_netscan_graph.py
```

---

## 🚀 Usage

Run:
```bash
./netscan_mapper.sh <network_range>
```

**Example:**
```bash
./netscan_mapper.sh 10.10.10.0/24
```

This will:
✅ Scan the network.  
✅ Generate `netscan_<date>.csv` with the results.  
✅ Automatically generate a PNG graph summarizing the hosts and open ports.

---

## 🖼️ Viewing the Graph

Open it with:
```bash
xdg-open netscan_<date>.png
```

---

## 🗂️ Folder Structure

- `netscan_mapper.sh`: Main scanner script.
- `generate_netscan_graph.py`: Graph generator.
- `netscan_<date>.csv`: Results.
- `netscan_<date>.png`: Network visualization.

---

## 📜 License

MIT License.

---

## 🤝 Contributing

This tool helps you **structure your pentesting practice and OSCP preparation efficiently.** Feel free to fork and adapt it to your workflow.
