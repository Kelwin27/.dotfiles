{ ... }:
let
  browser = "zen-beta";
  pdf = "org.gnome.Papers";
in
{
  wayland.windowManager.hyprland.settings = {
    # windowrule
    windowrule = [
      "border_size 0, match:float 1"
      "float on, match:class ^(Viewnior)$"
      "float on, match:class ^(imv)$"
      "float on, match:class ^(mpv)$"
      "float on, match:class ^(Audacious)$"
      "pin on, match:class ^(rofi)$"
      "pin on, match:class ^(waypaper)$"
      # "idle_inhibit focus, match:class mpv"
      # "float on, match:class udiskie"
      "float on, match:title ^(Transmission)$"
      "float on, match:title ^(Volume Control)$"
      "float on, match:title ^(Firefox — Sharing Indicator)$"
      "move 0 0, match:title ^(Firefox — Sharing Indicator)$"
      "size 700 450, match:title ^(Volume Control)$"
      "move 40 55%, match:title ^(Volume Control)$"
      "float on, match:title ^(Picture-in-Picture)$"
      "opacity 1.0 override 1.0 override, match:title ^(Picture-in-Picture)$"
      "pin on, match:title ^(Picture-in-Picture)$"
      "opacity 1.0 override 1.0 override, match:title ^(.*imv.*)$"
      "opacity 1.0 override 1.0 override, match:title ^(.*mpv.*)$"
      "opacity 1.0 override 1.0 override, match:class zen"
      "opacity 1.0 override 1.0 override, match:class evince"
      "workspace 1, match:class ^(${browser})$"
      "workspace 3, match:class ^(codium)$"
      "workspace 4, match:class ^(${pdf})$"
      "workspace 5, match:class ^(Gimp-2.10)$"
      "workspace 5, match:class ^(Audacious)$"
      "workspace 10, match:class ^(vesktop)$"
      "idle_inhibit focus, match:class ^(mpv)$"
      "idle_inhibit fullscreen, match:class ^(firefox)$"
      "float on, match:class ^(org.gnome.Calculator)$"
      "float on, match:class ^(waypaper)$"
      "float on, match:class ^(zenity)$"
      "size 850 500, match:class ^(zenity)$"
      "size 725 330, match:class ^(SoundWireServer)$"
      "float on, match:class ^(org.gnome.FileRoller)$"
      "float on, match:class ^(org.pulseaudio.pavucontrol)$"
      "float on, match:class ^(SoundWireServer)$"
      "float on, match:class ^(.sameboy-wrapped)$"
      "float on, match:class ^(file_progress)$"
      "float on, match:class ^(confirm)$"
      "float on, match:class ^(dialog)$"
      "float on, match:class ^(download)$"
      "float on, match:class ^(notification)$"
      "float on, match:class ^(error)$"
      "float on, match:class ^(confirmreset)$"
      "float on, match:title ^(Open File)$"
      "float on, match:title ^(File Upload)$"
      "float on, match:title ^(branchdialog)$"
      "float on, match:title ^(Confirm to replace files)$"
      "float on, match:title ^(File Operation Progress)$"
      "opacity 0.0 override, match:class ^(xwaylandvideobridge)$"
      "no_anim on, match:class ^(xwaylandvideobridge)$"
      "no_initial_focus on, match:class ^(xwaylandvideobridge)$"
      "max_size 1 1, match:class ^(xwaylandvideobridge)$"
      "no_blur on, match:class ^(xwaylandvideobridge)$"
      # No gaps when only
      "border_size 0, match:float off, match:workspace w[t1]"
      "rounding 0, match:float off, match:workspace w[t1]"
      "border_size 0, match:float off, match:workspace w[tg1]"
      "rounding 0, match:float off, match:workspace w[tg1]"
      "border_size 0, match:float off, match:workspace f[1]"
      "rounding 0, match:float off, match:workspace f[1]"
      # "max_size 1111 700, match:float on"
      # "center on, match:float on"
      # Remove context menu transparency in chromium based apps
      "opaque on, match:class ^$, match:title ^$"
      "no_shadow on, match:class ^$, match:title ^$"
      "no_blur on, match:class ^$, match:title ^$"
    ];
    # No gaps when only
    workspace = [
      "w[t1], gapsout:0, gapsin:0"
      "w[tg1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
    ];
  };
}
