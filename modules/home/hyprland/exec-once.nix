{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  browser = "zen-beta";
  terminal = "ghostty";
in
{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lua ''
        function()
          hl.exec_cmd("dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
          hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

          hl.exec_cmd("noctalia")
          hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")

          hl.dispatch(hl.dsp.exec_cmd("${browser}", { workspace = "1 silent" }))
          hl.dispatch(hl.dsp.exec_cmd("${terminal}", { workspace = "2 silent" }))
        end
      '')
    ];
  };
}
