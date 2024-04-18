#!/bin/bash

# Bash Script to Analyze Network Traffic

# Input: Path to the Wireshark pcap file
pcap_file="$1"

# Function to extract information from the pcap file
analyze_traffic() {
    total_packets=$(tshark -r "$pcap_file" -T fields -e frame.number 2>/dev/null | wc -l)
    http_packets=$(tshark -r "$pcap_file" -Y "http" 2>/dev/null | wc -l)
    tls_packets=$(tshark -r "$pcap_file" -Y "tls" 2>/dev/null | wc -l)

    top_source_ips=$(tshark -r "$pcap_file" -T fields -e ip.src 2>/dev/null | sort | uniq -c | sort -nr | head -5)
    top_dest_ips=$(tshark -r "$pcap_file" -T fields -e ip.dst 2>/dev/null | sort | uniq -c | sort -nr | head -5)

    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    echo "1. Total Packets: $total_packets"
    echo "2. Protocols:"
    echo "   - HTTP: $http_packets packets"
    echo "   - HTTPS/TLS: $tls_packets packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    echo "$top_source_ips"
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    echo "$top_dest_ips"
    echo "----- End of Report -----"
}

# Check if the pcap file is provided
if [ -z "$pcap_file" ]; then
    echo "Usage: $0 <PCAP_FILE>"
    exit 1
fi

# Check if the pcap file exists
if [ ! -f "$pcap_file" ]; then
    echo "Error: File '$pcap_file' not found."
    exit 1
fi

# Run the analysis function
analyze_traffic
