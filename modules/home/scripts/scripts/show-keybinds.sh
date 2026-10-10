#!/usr/bin/env bash

# Used to open the list in a rofi dmenu. Noctalia has no generic overlay, and
# zenity is already installed and already floats via the windowrules, so the
# list becomes a small floating text window instead.

config_file=~/.config/hypr/hyprland.conf
keybinds=$(grep -oP '(?<=bind=).*' "$config_file")
keybinds=$(echo "$keybinds" | sed 's/,\([^,]*\)$/ = \1/' | sed 's/, exec//g' | sed 's/^,//g')

zenity --info --text-info --title="Keybinds" \
    --width=700 --height=800 \
    --font=Pango.Mono.10 \
    --text="$keybinds"