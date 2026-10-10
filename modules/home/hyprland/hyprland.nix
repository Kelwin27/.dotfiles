{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    grim
    slurp
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
    configType = "hyprlang";
    package = null;
    portalPackage = null;

    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };
}
