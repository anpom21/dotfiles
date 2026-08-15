#!/usr/bin/env bash
set -euo pipefail

echo "Installing desktop applications..."

install_snap() {
  local package="$1"
  shift

  if snap list "$package" >/dev/null 2>&1; then
    echo "$package already installed."
  else
    sudo snap install "$package" "$@"
  fi
}

# Spotify
install_snap spotify

# Obsidian requires classic confinement.
install_snap obsidian --classic

# Discord
install_snap discord

# Bambu Studio
if flatpak info com.bambulab.BambuStudio >/dev/null 2>&1; then
  echo "Bambu Studio already installed."
else
  flatpak install -y flathub com.bambulab.BambuStudio
fi

echo "Desktop applications installed."