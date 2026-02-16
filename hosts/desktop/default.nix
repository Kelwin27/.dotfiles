{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/26d5850e-e245-4932-a783-af2ddff64c58";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
