#!/bin/bash

# Scanning module

domain=$1
output_directory=$2

echo -e "\033[1;33m🛠️ Starting scanning for domain: $domain\033[0m"

# Create output directory if it doesn't exist
mkdir -p $output_directory

# Run scanning tools
tools=(
    "masscan -p1-65535 $domain --rate=1000 -oX $output_directory/scan_masscan.xml"
    "nmap -sC -sV -iL $output_directory/scan_masscan.xml -oN $output_directory/scan_nmap.txt"
    "naabu -host $domain -o $output_directory/scan_naabu.txt"
)

for tool in "${tools[@]}"; do
    echo -e "\033[1;32mRunning: $tool\033[0m"
    eval $tool
done

echo -e "\033[1;33m🛠️ Scanning completed for domain: $domain\033[0m"
