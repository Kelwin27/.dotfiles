{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    go
    nodejs
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
