#!/bin/bash
cd ~/Code/dotfiles
git pull

folders=("hypr" "ags" "tmux" "lazygit" "kitty" "fish" "nvim")

# Replace the monitors part of hyprland config

current_host=""
if [[ $(hostname) == "johnc-desktop" ]]; then
	current_host="DESKTOP"
else
	current_host="LAPTOP"
fi

sed -i "s/#$current_host: //" ./hypr/hyprland/monitors.conf

for folder in ${folders[@]}; do
  echo Moving $folder
  rsync -a ./$folder/ ~/.config/$folder
done

# Starship
cp starship.toml ~/.config/starship.toml

# Cleanup

sed -i "s/^monitor/#$current_host: monitor/" ./hypr/hyprland/monitors.conf
