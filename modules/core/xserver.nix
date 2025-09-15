{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.settings.Manager = "DefaultTimeoutStopSec=10s";
}
