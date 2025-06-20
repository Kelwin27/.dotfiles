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
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
