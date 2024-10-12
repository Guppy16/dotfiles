#!/bin/bash

# Path to the JSON file
json_file="$HOME/.config/obsidian/obsidian.json"

# Check if the JSON file exists
if [[ ! -f "$json_file" ]]; then
    echo "JSON file not found: $json_file"
    exit 1
fi

# cat "$json_file"

cp "$json_file" "$json_file.bak"


# Use jq to remove "open" fields from "vaults" where "open": true
jq '(.vaults[] | select(.open == true)) |= del(.open)' "$json_file" > tmp.json

# Replace the original JSON file with the modified one
mv tmp.json "$json_file"

echo "Updated JSON file successfully."

obsidian
