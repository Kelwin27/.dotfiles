{ ... }:
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
