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

    adwaita-qt
    adwaita-qt6
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    package = null;
    portalPackage = null;
    systemd.enable = true;
  };
}
