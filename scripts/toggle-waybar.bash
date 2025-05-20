cd ~/Code/dotfiles/scripts

waybar_status=$(ps -a | rg "waybar" | awk '{print $1}')

if [ -z $waybar_status ]; then
    # Waybar not found. Let's toggle it

    echo "Starting"
    waybar &
else
    # Waybar found, lets close it.
    echo "Killing"
    echo $(kill $waybar_status)
fi
