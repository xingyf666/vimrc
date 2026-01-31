```bash

sudo pacman -S i3-wm i3status
sudo pacman -S lxappearance
sudo pacman -S flameshot
sudo pacman -S feh nitrogen
sudo pacman -S thunar
sudo pacman -S kitty wezterm alacritty
sudo pacman -S adwaita-icon-theme adwaita-cursor
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-rime
sudo pacman -S pulseaudio
sudo pacman -S mplayer vlc
sudo pacman -S picom
sudo pacman -S nerd-fonts
sudo pacman -S tmux
sudo pacman -S yazi lazygit
sudo pacman -S warpd
sudo pacman -S dunst

# https://github.com/Reverier-Xu/Ori-fcitx5
paru -S fcitx5-skin-ori-git

# https://github.com/Reverier-Xu/Fluent-fcitx5
paru -S fcitx5-skin-fluentdark-git
paru -S fcitx5-skin-fluentlight-git


# https://wiki.archlinux.org/title/GTK#Dark_theme_variant
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# https://github.com/newmanls/rofi-themes-collection
git clone https://github.com/lr-tech/rofi-themes-collection.git /tmp/rofi-themes-collection
mkdir -p ~/.local/share/rofi/themes/
cp /tmp/rofi-themes-collection/themes/*.rasi ~/.local/share/rofi/themes/
cp -r /tmp/rofi-themes-collection/themes/templates ~/.local/share/rofi/themes/

# https://github.com/alacritty/alacritty-theme
# git clone https://github.com/alacritty/alacritty-theme /tmp/alacritty-theme
# mkdir -p ~/.config/alacritty/themes
# cp -r /tmp/alacritty-theme/themes/*.toml ~/.config/alacritty/themes

```
