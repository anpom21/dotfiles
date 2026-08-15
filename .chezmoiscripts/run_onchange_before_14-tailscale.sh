#!/usr/bin/env bash
set -euo pipefail

echo "Installing Tailscale..."

if command -v tailscale >/dev/null 2>&1; then
  echo "Tailscale already installed: $(tailscale version | head -n1)"
else
  curl -fsSL https://tailscale.com/install.sh | sh
fi

sudo systemctl enable --now tailscaled

echo
echo "Tailscale installed."
echo "Connect this machine with:"
echo
echo "  sudo tailscale up"
echo