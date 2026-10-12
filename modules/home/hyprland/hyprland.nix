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

    # Qt style plugin that makes Qt apps follow the GTK theme. Both Qt
    # generations ship, so Qt5 apps and vesktop (Qt6) are both covered.
    adwaita-qt
    adwaita-qt6
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
