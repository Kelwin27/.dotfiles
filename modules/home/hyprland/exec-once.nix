{ ... }:
let
  browser = "zen-beta";
  terminal = "ghostty";
  pdf = "evince";
in
{
  wayland.windowManager.hyprland.settings.exec-once = [
    # "hash dbus-update-activation-environment 2>/dev/null"
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    "hyprlock"

    "nm-applet &"
    "poweralertd &"
    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
    "waybar &"
    "swaync &"
    "hyprctl setcursor Bibata-Modern-Ice 24 &"
    "swww-daemon &"

    "~/NoDPI/src/main.py --blacklist ~/NoDPI/blacklist.txt -q &"

    "[workspace 1 silent] ${browser}"
    "[workspace 2 silent] ${terminal}"
    "[workspace 4 silent] ${pdf}"
  ];
}
