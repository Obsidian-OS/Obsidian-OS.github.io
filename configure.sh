#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
  echo "You are root, please run this script as a non-root user."
  exit 1
fi
echo "Branding ObsidianOS..."
sudo curl -fL https://obsidianos.xyz/os-release -o /etc/os-release
echo "Branding /etc/issue..."
sudo curl -fL https://obsidianos.xyz/issue -o /etc/issue
echo "Attempting to add ObsidianOS branding packages..."
if command -v yay >/dev/null 2>&1; then
  echo "Found yay"
  yay -S obsidianos-branding obos-genissue-git --overwrite '*' --noconfirm --needed
fi
echo "Attempting to add obsidianctl..."
if command -v yay >/dev/null 2>&1; then
  echo "Found yay"
  yay -S obsidianctl-git --overwrite '*' --noconfirm --needed
fi
echo "Done!"
