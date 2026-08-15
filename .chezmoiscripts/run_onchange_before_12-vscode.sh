#!/usr/bin/env bash
set -euo pipefail

echo "Installing Visual Studio Code..."

sudo apt-get install -y wget gpg

sudo mkdir -p /usr/share/keyrings

if [ ! -f /usr/share/keyrings/microsoft.gpg ]; then
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/microsoft.gpg >/dev/null
fi

sudo chmod 644 /usr/share/keyrings/microsoft.gpg

sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null <<'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64 arm64 armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

sudo apt-get update
sudo apt-get install -y code

echo "VS Code installed."