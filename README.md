# Network-Traffic-Analysis-with-Bash-Script
### Objective
Analyze network traffic captured using Wireshark, and generate a summary report using a Bash script.

### Scope
- Capture network traffic using Wireshark.
- Develop a Bash script to analyze captured data.
- Extract total packets, protocols, and top source/destination IP addresses.
- Generate a summary report.

### Prerequisites
- Wireshark installation.
- Permission to capture network traffic.
- Basic Bash scripting knowledge.

## Bash Script: `analyze_traffic.sh`

### Usage
```bash
./analyze_traffic.sh <PCAP_FILE>
```
### Features
- Count total packets.
- Identify HTTP and HTTPS/TLS packets.
- List top 5 source and destination IP addresses.
  
## Sample Output
```
----- Network Traffic Analysis Report -----
1. Total Packets: 1000
2. Protocols:
   - HTTP: 600 packets
   - HTTPS/TLS: 400 packets

3. Top 5 Source IP Addresses:
   - 192.168.1.1: 300 packets
   - 192.168.1.2: 200 packets

4. Top 5 Destination IP Addresses:
   - 10.0.0.1: 400 packets
   - 10.0.0.2: 300 packets
----- End of Report -----
```
## Implementation
- Utilizes tshark for packet analysis.
- Filters for HTTP and HTTPS/TLS protocols.
## Hints
- Research Wireshark command-line tools like tshark.
- Utilize filters for protocol-specific analysis.
