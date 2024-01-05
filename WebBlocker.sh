#!/bin/bash

# Function to display WebBlocker ASCII art banner
display_banner() {
    echo "  ______           _           _     _"
    echo " |  ____|         | |         | |   | |"
    echo " | |__ _ __   __ _| |_ __ _ __| |___| | ___  __ _ _ __ ___   __ _"
    echo " |  __| '_ \ / _\` | __/ _\` / __| / __| |/ _ \/ _\` | '_ \` _ \ / _\` |"
    echo " | |____| | | | (_| | || (_| \__ \ \__ \ |  __/ (_| | | | | | | (_| |"
    echo " |______|_| |_|\__,_|\__\__,_|___/_|___/_|\___|\__, |_| |_| |_|\__,_|"
    echo "                                                  __/ |"
    echo "                                                 |___/"
}

# Function to block the website
block_website() {
    # Check if a website domain is provided
    if [ -z "$website" ]; then
        echo "Website domain cannot be empty."
        exit 1
    fi

    # Block the website
    echo "Blocking website: $website"

    # Simulate blocking by sleeping for a few seconds
    sleep 10
}

# Function to unblock the website
unblock_website() {
    # Unblock the website
    echo "Unblocking website: $website"
}

# Display WebBlocker banner
display_banner

# Prompt user for the website to block
read -p "Enter the website to block: " website

# Check if a website domain is provided
if [ -z "$website" ]; then
    echo "Website domain cannot be empty."
    exit 1
fi

# Block the website
block_website

# Ask the user if they want to unblock the website
while true; do
    read -p "Do you want to unblock the website? (y/n): " response
    case $response in
        [Yy]* ) unblock_website; break;;
        [Nn]* ) echo "Website remains blocked."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
