#!/usr/bin/env bash

# Toggles a floating btop window: closes it when one is already open,
# otherwise spawns it. The size matches the other floating windows
# (ALT Return, ALT E), so every floating terminal looks the same.
#
# The window is found by its title, not by its class: `ghostty --class` leaves
# the app id Hyprland reports untouched (it still shows com.mitchellh.ghostty),
# so a class based lookup never matches and every press spawns another window.
# initialTitle is read when the window maps and is never rewritten, so it
# survives whatever btop or the shell integration do to the live title.

set -euo pipefail

title="resources"

addr=$(hyprctl clients -j 2> /dev/null |
    jq -r --arg title "$title" '
        map(select(.initialTitle == $title or .title == $title))
        | .[0]
        | .address // empty')

if [[ -n "$addr" ]]; then
    hyprctl dispatch closewindow "address:$addr" > /dev/null
else
    hyprctl dispatch exec "[float; size 1111 700] ghostty --title=$title -e btop" > /dev/null
fi
