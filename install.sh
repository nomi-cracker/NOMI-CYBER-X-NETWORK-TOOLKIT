#!/data/data/com.termux/files/usr/bin/bash

pkg update -y

pkg install -y \
curl \
jq \
nano \
git \
termux-api \
dnsutils

chmod +x toolkit.sh

echo
echo "Installation Complete"
echo
echo "Run using:"
echo "bash toolkit.sh"
