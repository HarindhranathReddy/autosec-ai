#!/bin/bash

# AutoSecAI-Plus main script

# Load configuration
config_file="config.yaml"
output_directory=$(cat $config_file | grep output_directory | awk '{ print $2 }')

# Function to display usage
usage() {
  echo -e "\033[1;33mUsage: $0 -d <domain> [--full-scan|--recon|--scan|--exploit|--ai-payload|--report]\033[0m"
  exit 1
}

# Check if at least one argument is provided
if [ $# -lt 2 ]; then
  usage
fi

# Parse arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -d|--domain)
      domain="$2"
      shift
      ;;
    --full-scan)
      full_scan=true
      ;;
    --recon)
      recon=true
      ;;
    --scan)
      scan=true
      ;;
    --exploit)
      exploit=true
      ;;
    --ai-payload)
      ai_payload=true
      ;;
    --report)
      report=true
      ;;
    *)
      usage
      ;;
  esac
  shift
done

# Function to print a colorful message
print_message() {
  local message=$1
  local color=$2
  echo -e "\033[${color}m${message}\033[0m"
}

# Function to run a tool and handle errors
run_tool() {
  local tool_command=$1
  print_message "Running: $tool_command" "1;32"
  eval $tool_command
  if [ $? -ne 0 ]; then
    print_message "Error running: $tool_command" "1;31"
  fi
}

# Execute modules based on arguments
if [ "$full_scan" == true ]; then
  print_message "🚀 Starting full scan for domain: $domain" "1;36"
  ./modules/reconnaissance/recon.sh "$domain" "$output_directory"
  ./modules/scanning/scan.sh "$domain" "$output_directory"
  ./modules/exploitation/exploit.sh "$domain" "$output_directory"
  ./modules/ai_payloads/ai_payload.sh "$domain" "$output_directory"
  ./modules/reporting/report.sh "$domain" "$output_directory"
  print_message "🎉 Full scan completed for domain: $domain" "1;32"
elif [ "$recon" == true ]; then
  print_message "🔍 Starting reconnaissance for domain: $domain" "1;34"
  ./modules/reconnaissance/recon.sh "$domain" "$output_directory"
  print_message "🔍 Reconnaissance completed for domain: $domain" "1;32"
elif [ "$scan" == true ]; then
  print_message "🛠️ Starting scanning for domain: $domain" "1;33"
  ./modules/scanning/scan.sh "$domain" "$output_directory"
  print_message "🛠️ Scanning completed for domain: $domain" "1;32"
elif [ "$exploit" == true ]; then
  print_message "💥 Starting exploitation for domain: $domain" "1;31"
  ./modules/exploitation/exploit.sh "$domain" "$output_directory"
  print_message "💥 Exploitation completed for domain: $domain" "1;32"
elif [ "$ai_payload" == true ]; then
  print_message "🤖 Starting AI-powered payload generation for domain: $domain" "1;35"
  ./modules/ai_payloads/ai_payload.sh "$domain" "$output_directory"
  print_message "🤖 AI-powered payload generation completed for domain: $domain" "1;32"
elif [ "$report" == true ]; then
  print_message "📝 Starting report generation for domain: $domain" "1;37"
  ./modules/reporting/report.sh "$domain" "$output_directory"
  print_message "📝 Report generation completed for domain: $domain" "1;32"
else
  usage
fi
