{ pkgs, ... }:
{
  services = {
    # Still needed after nemo went away: gvfs backs recent:// and the MTP mount
    # that GTK file choosers use, and tinysparql serves search://. Neither has a
    # client among the remaining apps yet, so both are candidates for removal.
    gvfs.enable = true;
    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };
    dbus.enable = true;
    fstrim.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = with pkgs; [
      gcr_4
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
      ExecStart = "${pkgs.python3}/bin/python /home/kelwin/NoDPI/src/main.py --blacklist /home/kelwin/NoDPI/blacklist.txt -q";
      Restart = "on-failure";
      RestartSec = 5;
      StandardOutput = "null";
    };
    wantedBy = [ "graphical-session.target" ];
  };
}
