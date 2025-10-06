{ username, ... }:
{
  services = {
    getty.autologinUser = "${username}";

    libinput = {
      enable = true;
    };
  };
  environment.interactiveShellInit = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=Hyprland
      exec Hyprland
    fi
  '';
  # To prevent getting stuck at shutdown
  systemd.settings.Manager = {
    DefaultTimeoutStartSec = "90s";
    DefaultTimeoutStopSec = "90s";
  };
}
