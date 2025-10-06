{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";

  environment.systemPackages = with pkgs; [
    go
    nodejs
  ];

  fileSystems."/mnt/ubuntu" = {
    device = "/dev/disk/by-uuid/f346a8b9-5bb2-4ab2-9c8e-7b1ce0dd1dca";
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
