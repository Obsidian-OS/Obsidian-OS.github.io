#!/usr/bin/env bash
# install.sh - install ObsidianOS from an normal arch host

# Function to check if a command exists
check_command() {
  local cmd="$1"
  local extra_msg="$2"
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: Required command '$cmd' not found. Please install it."
    [[ -n "$extra_msg" ]] && echo "$extra_msg"
    exit 1
  fi
}

# Check for root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Check for needed commands
check_command git
check_command make
check_command python3
check_command mktemp

# Make temporary directory
TMPDIR="/tmp" # was something else but then obsidian-wizard would not like it

clear
echo "Starting ARbs, the ARch image Based inStaller..."
echo "Bootstrapping obsidianctl and obsidian-wizard into /tmp..."
rm "$TMPDIR/obsidian*" "/tmp/mkobsidiansfs" -rf||yes
# Clone and prepare obsidian-wizard and obsidianctl
git clone https://github.com/Obsidian-OS/obsidian-wizard "$TMPDIR/obsidian-wizard"
git clone https://github.com/Obsidian-OS/obsidianctl "$TMPDIR/obsidianctl"
bash -c "cd /$TMPDIR/obsidianctl;make"
chmod u+x "$TMPDIR/obsidian-wizard/obsidian-wizard.py"

# Run script
echo "Starting ARbs, the ARch image Based inStaller..."
"$TMPDIR/obsidian-wizard/obsidian-wizard.py"
clear
echo "Thanks for using ARbs, the ARch image Based inStaller!"
