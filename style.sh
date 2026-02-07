#!/bin/bash
echo "Branding ObsidianOS..."
cat << 'EOF' > /etc/os-release
NAME="ObsidianOS"
PRETTY_NAME="Obsidian GNU/Linux"
ID=obsidian
BUILD_ID=rolling
ANSI_COLOR="38;2;138;43;226"
HOME_URL="https://obsidianos.xyz"
DOCUMENTATION_URL="https://wiki.obsidianos.xyz"
SUPPORT_URL="https://github.com/orgs/Obsidian-OS/discussions"
BUG_REPORT_URL="https://github.com/orgs/Obsidian-OS/discussions"
PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/"
LOGO=obsidianos
EOF
echo "Branding /etc/issue..."
cat << 'EOF' > /etc/issue
O]\  |  ___ *    | *  __n a___ O]\  ___
\ \\ |  S__   ___|   ___| |  | \ \\ S__
 \[] b] __| I D__| I |__| |  |  \[] __|
You are on \n running kernel \r for \m
It is currently \d \t and you are on tty \l
Thanks for using ObsidianOS!
EOF
echo "Done!"
echo "If using Arch based ObsidianOS install the AUR package obos-genissue-git."
