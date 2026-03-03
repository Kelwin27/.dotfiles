{ ... }:
let
  browser = "zen-beta";
  terminal = "ghostty";
in
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    "waypaper --restore &"

    "nm-applet &"
    "poweralertd &"
    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
    "waybar &"
    "swaync &"
    "hyprctl setcursor Bibata-Modern-Ice 24 &"

    "[workspace 1 silent] ${browser}"
    "[workspace 2 silent] ${terminal}"
  ];
}
