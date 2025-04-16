import platform
import os
import shutil
from datetime import datetime
from pathlib import Path

# Define target folders relative to user home
TARGET_DIRS = ["Desktop", "Documents", "Downloads", "Videos"]

def get_user_home():
    return Path.home()

def get_destination_path():
    script_path = Path(__file__).resolve()
    root_path = script_path.parent
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    backup_dir = root_path / "backups" / timestamp
    backup_dir.mkdir(parents=True, exist_ok=True)
    return backup_dir

def copy_data(source_dirs, destination):
    for folder in source_dirs:
        if folder.exists():
            dest_path = destination / folder.name
            print(f"Copying {folder} -> {dest_path}")
            try:
                shutil.copytree(folder, dest_path, dirs_exist_ok=True)
            except Exception as e:
                print(f"Failed to copy {folder}: {e}")
        else:
            print(f"Skipping {folder} (not found)")

if __name__ == "__main__":
    home_dir = get_user_home()
    source_dirs = [home_dir / d for d in TARGET_DIRS]
    destination = get_destination_path()
    copy_data(source_dirs, destination)
