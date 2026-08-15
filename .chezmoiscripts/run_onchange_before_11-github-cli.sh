#!/usr/bin/env bash
set -euo pipefail

echo "Installing GitHub CLI..."

if command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI already installed: $(gh --version | head -n1)"
  exit 0
fi

sudo mkdir -p -m 755 /etc/apt/keyrings

wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null

sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

ARCH="$(dpkg --print-architecture)"

echo \
  "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

sudo apt-get update
sudo apt-get install -y gh

echo "GitHub CLI installed."
echo "Authenticate later with: gh auth login"