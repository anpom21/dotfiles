dconf load /org/gnome/desktop/interface/ \
  < ~/.config/gnome-backup/interface.conf

dconf load /org/gnome/desktop/wm/ \
  < ~/.config/gnome-backup/wm.conf

dconf load /org/gnome/desktop/wm/keybindings/ \
  < ~/.config/gnome-backup/keybindings.conf

dconf load /org/gnome/shell/ \
  < ~/.config/gnome-backup/shell.conf

dconf load /org/gnome/settings-daemon/plugins/media-keys/ \
  < ~/.config/gnome-backup/media-keys.conf
