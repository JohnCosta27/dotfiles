#!/bin/bash
cd ~/Code/dotfiles
git pull

# Replace the monitors part of hyprland config

current_host=""
if [[ $(hostnamectl hostname) == "john-desktop" ]]; then
	current_host="DESKTOP"
else
	current_host="LAPTOP"
fi

echo Current hostname: $current_host

sed -i "s/#$current_host: //" .config/hypr/hyprland.conf

for file in ".config"/*; do
    echo "rsync -av $file ~/.config --delete"
    rsync -av $file ~/.config --delete
done

DISPLAY=:0 kitty metapac sync

# Cleanup

sed -i "s/^monitor/#$current_host: monitor/" .config/hypr/hyprland.conf
