#!/bin/bash
cd ~/Code/dotfiles
git pull

# Replace the monitors part of hyprland config

# current_host=""
# if [[ $(hostname) == "johnc-desktop" ]]; then
# 	current_host="DESKTOP"
# else
# 	current_host="LAPTOP"
# fi
#
# sed -i "s/#$current_host: //" ./hypr/hyprland/monitors.conf

for file in ".config"/*; do
    echo "rsync -av $file ~/.config --delete"
    rsync -av $file ~/.config --delete
done

metapac sync

# Cleanup

# sed -i "s/^monitor/#$current_host: monitor/" ./hypr/hyprland/monitors.conf
