{ ... }:
let
  browser = "zen-beta";
  pdf = "org.gnome.Papers";

  wr = match: effect: { inherit match; } // effect;
  floatOn = match: wr match { float = true; };

  opaqueOpacity = "1.0 override 1.0 override";
in
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      (wr { float = true; } { border_size = 0; })
      (floatOn { class = "^(imv)$"; })
      (floatOn { class = "^(mpv)$"; })
      (floatOn { class = "^(Audacious)$"; })
      (floatOn { title = "^(Transmission)$"; })
      (wr { title = "^(Volume Control)$"; } {
        float = true;
        size = "700 450";
        move = "40 55%";
      })
      (wr { title = "^(Firefox — Sharing Indicator)$"; } {
        float = true;
        move = "0 0";
      })
      (wr { title = "^(Picture-in-Picture)$"; } {
        float = true;
        opacity = opaqueOpacity;
        pin = true;
      })
      (wr { title = "^(.*imv.*)$"; } { opacity = opaqueOpacity; })
      (wr { title = "^(.*mpv.*)$"; } { opacity = opaqueOpacity; })
      (wr { class = "zen"; } { opacity = opaqueOpacity; })
      (wr { class = "^(${browser})$"; } { workspace = "1"; })
      (wr { class = "^(codium)$"; } { workspace = "3"; })
      (wr { class = "^(${pdf})$"; } { workspace = "4"; })
      (wr { class = "^(Gimp-2.10)$"; } { workspace = "5"; })
      (wr { class = "^(Audacious)$"; } { workspace = "5"; })
      (wr { class = "^(vesktop)$"; } { workspace = "10"; })
      (wr { class = "^(mpv)$"; } { idle_inhibit = "focus"; })
      (wr { class = "^(firefox)$"; } { idle_inhibit = "fullscreen"; })
      (floatOn { class = "^(org.gnome.Calculator)$"; })
      (wr { class = "^(zenity)$"; } {
        float = true;
        size = "850 500";
      })
      (wr { class = "^(SoundWireServer)$"; } {
        float = true;
        size = "725 330";
      })
      (floatOn { class = "^(org.gnome.FileRoller)$"; })
      (floatOn { class = "^(org.pulseaudio.pavucontrol)$"; })
      (floatOn { class = "^(.sameboy-wrapped)$"; })
      (floatOn { class = "^(file_progress)$"; })
      (floatOn { class = "^(confirm)$"; })
      (floatOn { class = "^(dialog)$"; })
      (floatOn { class = "^(download)$"; })
      (floatOn { class = "^(notification)$"; })
      (floatOn { class = "^(error)$"; })
      (floatOn { class = "^(confirmreset)$"; })
      (floatOn { title = "^(Open File)$"; })
      (floatOn { title = "^(File Upload)$"; })
      (floatOn { title = "^(branchdialog)$"; })
      (floatOn { title = "^(Confirm to replace files)$"; })
      (floatOn { title = "^(File Operation Progress)$"; })
      (wr { class = "^(xwaylandvideobridge)$"; } {
        opacity = "0.0 override";
        no_anim = true;
        no_initial_focus = true;
        max_size = "1 1";
        no_blur = true;
      })
      (wr {
        float = false;
        workspace = "w[t1]";
      } { border_size = 0; })
      (wr {
        float = false;
        workspace = "w[tg1]";
      } { border_size = 0; })
      (wr {
        float = false;
        workspace = "f[1]";
      } { border_size = 0; })
      (wr
        {
          class = "^$";
          title = "^$";
        }
        {
          opaque = true;
          no_shadow = true;
          no_blur = true;
        }
      )
    ];

    workspace_rule = [
      {
        workspace = "w[t1]";
        gaps_out = 6;
        gaps_in = 0;
      }
      {
        workspace = "w[tg1]";
        gaps_out = 0;
        gaps_in = 0;
      }
      {
        workspace = "f[1]";
        gaps_out = 0;
        gaps_in = 0;
      }
    ];
  };
}
