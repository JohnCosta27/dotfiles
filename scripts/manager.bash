#!/bin/bash
cd ~/Code/dotfiles
git pull

folders=("hypr" "ags" "tmux" "lazygit" "kitty" "fish")

for folder in ${folders[@]}; do
  echo Moving $folder
  rsync -a ./$folder/ ~/.config/$folder
done

# Starship
mv starship.toml ~/.config/starship.toml
