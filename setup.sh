#!/bin/bash

# Setup script for AutoSecAI-Plus

# Function to print a message and exit in case of error
function error_exit {
    echo "$1" 1>&2
    exit 1
}

# Function to install a package if it's not already installed
function install_package {
    if ! dpkg -l | grep -q "$1"; then
        echo "Installing $1..."
        sudo apt-get install -y "$1" || error_exit "Failed to install $1"
    else
        echo "$1 is already installed."
    fi
}

# Update package list
echo "Updating package list..."
sudo apt-get update || error_exit "Failed to update package list"

# Install Python3 and pip if not already installed
install_package python3
install_package python3-pip

# Install Python dependencies
echo "Installing Python dependencies..."
pip3 install -r requirements.txt || error_exit "Failed to install Python dependencies"

# Install other necessary tools
tools=(
    subfinder
    amass
    assetfinder
    shuffledns
    masscan
    nmap
    naabu
    waybackurls
    gau
    katana
    hakrawler
    nuclei
    gf
    nikto
    arachni
    jaeles
    sqlmap
    xsstrike
    commix
    lf-suite
    smuggler
    race-the-web
)

for tool in "${tools[@]}"; do
    install_package "$tool"
done

echo "Setup complete."