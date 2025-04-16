#!/bin/bash

# Get timestamp for folder
timestamp=$(date +"%Y%m%d-%H%M%S")

# Get path to this script
script_path="$(dirname "$(realpath "$0")")"
backup_folder="$script_path/backups/$timestamp"

# Create backup folder
mkdir -p "$backup_folder"

# Get home directory
home_dir="$HOME"

echo "Backing up Desktop, Documents, Downloads, and Videos..."

cp -a "$home_dir/Desktop" "$backup_folder/Desktop" 2>/dev/null
cp -a "$home_dir/Documents" "$backup_folder/Documents" 2>/dev/null
cp -a "$home_dir/Downloads" "$backup_folder/Downloads" 2>/dev/null
cp -a "$home_dir/Videos" "$backup_folder/Videos" 2>/dev/null

echo "Backup complete! Saved in: $backup_folder"
