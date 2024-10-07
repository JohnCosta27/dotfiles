#!/bin/bash
cd ~/Code/dotfiles
git pull

folders=("hypr" "ags" "tmux" "lazygit" "kitty" "fish" "nvim")

for folder in ${folders[@]}; do
  echo Moving $folder
  rsync -a ./$folder/ ~/.config/$folder
done

# Starship
cp starship.toml ~/.config/starship.toml
