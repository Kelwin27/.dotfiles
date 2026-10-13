#!/usr/bin/env bash

# Lists the live keybinds in a zenity window. The list comes from
# `hyprctl binds -j` instead of hyprland.conf, so the bindl entries (the media
# keys) and anything bound at runtime are shown too.
#
# --text-info is the dialog type on its own. zenity rejects it when combined
# with --info ("Two or more dialog options specified"), so never pass both.

set -euo pipefail

if ! binds=$(hyprctl binds -j 2> /dev/null); then
    zenity --error --title="Keybinds" \
        --text="hyprctl cannot reach Hyprland. Is HYPRLAND_INSTANCE_SIGNATURE set?"
    exit 1
fi

# modmask bits as reported by hyprctl, read off the running binds: 64 SUPER,
# 1 SHIFT, 4 CTRL, 8 ALT. The remaining bits are unused here but still named,
# so a key is never silently mislabelled.
keybinds=$(jq -r '
    def has($bit): ((.modmask / $bit) | floor) % 2 == 1;
    def mods:
        [ if has(64) then "SUPER" else empty end,
          if has(1)  then "SHIFT" else empty end,
          if has(4)  then "CTRL"  else empty end,
          if has(8)  then "ALT"   else empty end,
          if has(2)  then "CAPS"  else empty end,
          if has(16) then "MOD2"  else empty end,
          if has(32) then "MOD3"  else empty end
        ] | join(" ");
    .[]
    | [ mods, .key, .dispatcher, .arg ]
    | map(select(. != ""))
    | join(", ")
  ' <<< "$binds")

# --text-info has no --text option (that belongs to --info), and combining the
# two is rejected outright. The dialog reads its content from stdin instead.
printf '%s\n' "$keybinds" | zenity --text-info \
    --title="Keybinds" \
    --width=700 --height=800 \
    --font=Pango.Mono.10
