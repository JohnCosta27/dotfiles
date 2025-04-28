#!/bin/bash

cd ~/Code/dotfiles/scripts
status=$(cat ./status)

speaker_id=$(pw-dump | jq 'map(select(.type == "PipeWire:Interface:Node" and .info.props.["media.class"] == "Audio/Sink" and .info.props.["alsa.card_name"] == "HDA NVidia")) | map({"id"}) | .[].id')

headphone_id=$(pw-dump | jq 'map(select(.type == "PipeWire:Interface:Node" and .info.props.["media.class"] == "Audio/Sink" and .info.props.["alsa.card_name"] == "Razer Kraken Kitty Edition")) | map({"id"}) | .[].id')

if [ $status == "speakers" ]; then
    wpctl set-default $headphone_id
    echo "headphones" > ./status
else
    wpctl set-default $speaker_id
    echo "speakers" > ./status
fi
