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
  };
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
  };

  systemd.user.services.nodpi = {
    description = "NoDPI Service";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "/${pkgs.python3}/bin/python /home/kelwin/NoDPI/src/main.py --blacklist /home/kelwin/NoDPI/blacklist.txt -q";
      Restart = "always";
      RestartSec = 5;
      StandardOutput = "null";
    };
    wantedBy = [ "graphical-session.target" ];
  };
}
