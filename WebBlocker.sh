#!/bin/bash

# Function to display WebBlocker ASCII art banner
display_banner() {
    clear  # Clear the terminal
    echo "  _____           _           _     _"
    echo " |  __ \         | |         | |   | |"
    echo " | |__) |   _ ___| |_   _  __| |___| | ___  __ _ _ __ ___   __ _"
    echo " |  ___/ | | / __| | | | |/ _\` / __| |/ _ \/ _\` | '_ \` _ \ / _\` |"
    echo " | |   | |_| \__ \ | |_| | (_| \__ \ |  __/ (_| | | | | | | (_| |"
    echo " |_|    \__,_|___/\_\__,_|\__,_|___/_|\___|\__, |_| |_| |_|\__,_|"
    echo "                                            __/ |"
    echo "                                           |___/"
    echo "Welcome to WebBlocker - Your website blocking tool!"
    echo "Crafted by Thisizasif"
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
    sleep 5
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

