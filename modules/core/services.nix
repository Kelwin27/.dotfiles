{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };
    dbus.enable = true;
    fstrim.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];
    xserver.videoDrivers = [ "nvidia" ];
    speechd.enable = false;
  };
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
  };

  systemd.user.services.nodpi = {
    description = "NoDPI Service";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "/home/kelwin/GoDPI/nodpi \
      -socks5 127.0.0.1:1080 \
      -no-blacklist \
      -fragment-method random \
      -chunks 4 \
      -delay 10 \
      -verbose";

      Restart = "on-failure";
      RestartSec = 5;

      StandardOutput = "journal";
      StandardError = "journal";
    };
    wantedBy = [ "graphical-session.target" ];
  };
}
