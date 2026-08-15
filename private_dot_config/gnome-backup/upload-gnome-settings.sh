mkdir -p ~/.config/gnome-backup

dconf dump /org/gnome/desktop/interface/ \
  > ~/.config/gnome-backup/interface.conf

dconf dump /org/gnome/desktop/wm/ \
  > ~/.config/gnome-backup/wm.conf

dconf dump /org/gnome/desktop/wm/keybindings/ \
  > ~/.config/gnome-backup/keybindings.conf

dconf dump /org/gnome/shell/ \
  > ~/.config/gnome-backup/shell.conf

dconf dump /org/gnome/settings-daemon/plugins/media-keys/ \
  > ~/.config/gnome-backup/media-keys.conf
