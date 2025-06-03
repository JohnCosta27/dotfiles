#!/usr/bin/env bash
cd ~/Code/dotfiles

if [ -z  $@ ]; then
    echo "You must provide a package name."
    exit 1
fi

echo "metapac add --backend arch --package $@"
metapac add --backend arch --package $@

rsync -av ~/.config/metapac config --delete

metapac sync

echo "Adding package to git..."

git add .config/metapac
git commit -m "add-package: $@"
git push
