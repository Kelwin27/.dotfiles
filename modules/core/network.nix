{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      rejectPackets = true; # INPUT policy DROP
      allowedTCPPorts = [
        22
        80
        443
        51413 # Transmission
        59010
        59011
      ];
      allowedUDPPorts = [
        51413 # Transmission
        59010
        59011
      ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
