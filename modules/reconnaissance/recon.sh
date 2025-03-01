#!/bin/bash

# Reconnaissance module

domain=$1
output_directory=$2

echo -e "\033[1;34m🔍 Starting reconnaissance for domain: $domain\033[0m"

# Create output directory if it doesn't exist
mkdir -p $output_directory

# Run reconnaissance tools
tools=(
    "subfinder -d $domain -o $output_directory/recon_subfinder.txt"
    "assetfinder --subs-only $domain > $output_directory/recon_assetfinder.txt"
    "shuffledns -d $domain -w $output_directory/recon_assetfinder.txt -r resolvers.txt -o $output_directory/recon_shuffledns.txt"
)

for tool in "${tools[@]}"; do
    run_tool "$tool"
done

echo -e "\033[1;34m🔍 Reconnaissance completed for domain: $domain\033[0m"
