#!/usr/bin/env bash
set -euo pipefail

echo "Installing Ubuntu base packages..."

sudo apt-get update

sudo apt-get install -y \
  git \
  zsh \
  curl \
  wget \
  ca-certificates \
  gnupg \
  jq \
  unzip \
  build-essential \
  openssh-client \
  samba \
  smbclient \
  inkscape \
  snapd \
  flatpak \
  gnome-software-plugin-flatpak

# Add Flathub if it is not already configured.
if ! flatpak remotes --columns=name | grep -qx flathub; then
  flatpak remote-add --if-not-exists \
    flathub \
    https://flathub.org/repo/flathub.flatpakrepo
fi

echo "Base packages installed."