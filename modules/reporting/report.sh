#!/bin/bash

# Reporting module

domain=$1
output_directory=$2

echo -e "\033[1;37m📝 Starting report generation for domain: $domain\033[0m"

# Create output directory if it doesn't exist
mkdir -p $output_directory

# Generate reports
python3 modules/reporting/generate_report.py --domain $domain --output $output_directory

echo -e "\033[1;37m📝 Report generation completed for domain: $domain\033[0m"