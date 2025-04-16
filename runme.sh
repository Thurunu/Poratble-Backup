#!/bin/bash
echo "Backing up User Folders..."
python3 "$(dirname "$0")/backup.py"
