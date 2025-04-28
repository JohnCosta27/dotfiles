#!/bin/bash

cd ~/Code/dotfiles/scripts
status=$(cat ./status)

if [ $status == "speakers" ]; then
    wpctl set-default 62
    echo "headphones" > ./status
else
    wpctl set-default 68
    echo "speakers" > ./status
fi
