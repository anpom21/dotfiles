#!/bin/sh
set -eu

BACKUP="$HOME/.config/gnome-backup"

dconf load /org/gnome/desktop/interface/ < "$BACKUP/interface.conf"
dconf load /org/gnome/desktop/wm/ < "$BACKUP/wm.conf"
dconf load /org/gnome/desktop/wm/keybindings/ < "$BACKUP/keybindings.conf"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$BACKUP/media-keys.conf"
dconf load /org/gnome/shell/ < "$BACKUP/shell.conf"
