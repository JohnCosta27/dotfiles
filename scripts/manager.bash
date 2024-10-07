#!/bin/bash

folders=("hypr" "ags" "tmux" "lazygit" "kitty" "fish")

cd ..

for folder in ${folders[@]}; do
  echo Moving $folder
  rsync -a ./$folder/ ~/.config/$folder
done

# Starship
mv starship.toml ~/.config/starship.toml
