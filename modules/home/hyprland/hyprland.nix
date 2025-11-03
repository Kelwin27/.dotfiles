{ pkgs, inputs, ... }:
let
  grimblastPkg = inputs.hypr-contrib.packages.${pkgs.system}.grimblast;
  hyprpickerPkg = inputs.hyprpicker.packages.${pkgs.system}.hyprpicker;
in
{
  home.packages = with pkgs; [
    swww
    grimblastPkg
    hyprpickerPkg
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
