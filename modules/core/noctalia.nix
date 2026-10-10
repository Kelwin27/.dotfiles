{
  lib,
  host,
  ...
}:
{
  # Noctalia is a Wayland desktop shell that owns the bar, notifications, launcher,
  # lock screen, wallpaper and clipboard. It needs a running compositor, so the
  # QEMU-only host is excluded.
  programs.noctalia = lib.mkIf (host != "vm") {
    enable = true;

    # Started from Hyprland's exec-once rather than a systemd user unit. The session
    # is launched as `dbus-run-session -- Hyprland` from tty1 (see xserver.nix), so
    # neither graphical-session.target nor hyprland-session.target is ever pulled in
    # and the unit would never be started.
    systemd.enable = false;

    # Would pull in bluetooth, upower and power-profiles-daemon as mkDefaults.
    # Bluetooth is not used; the power services stay under their own host modules.
    recommendedServices.enable = false;
  };
}