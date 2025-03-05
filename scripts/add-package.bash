#!/usr/bin/env bash
cd ~/Code/dotfiles

echo "metapac add --backend arch --package $@"
metapac add --backend arch --package $@

rsync -av ~/.config/metapac .config --delete

metapac sync
