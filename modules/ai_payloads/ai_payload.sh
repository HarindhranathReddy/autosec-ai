#!/bin/bash

# AI Payload Generation module

domain=$1
output_directory=$2

echo -e "\033[1;35m🤖 Starting AI-powered payload generation for domain: $domain\033[0m"

# Create output directory if it doesn't exist
mkdir -p $output_directory

# Run AI-powered payload generation
python3 modules/ai_payloads/generate_payloads.py --domain $domain --output $output_directory

echo -e "\033[1;35m🤖 AI-powered payload generation completed for domain: $domain\033[0m"
