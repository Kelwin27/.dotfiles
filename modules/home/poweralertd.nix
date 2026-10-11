{
  lib,
  pkgs,
  host,
  ...
}:
lib.mkIf (host == "laptop") {
  home.packages = [ pkgs.poweralertd ];

  systemd.user.services.poweralertd = {
    Unit = {
      Description = "UPower-powered power alerter";
      Documentation = [ "man:poweralertd(1)" ];
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = lib.getExe pkgs.poweralertd;
      Restart = "on-failure";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
