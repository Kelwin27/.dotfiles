{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [ "ipv6.disable=1" ];
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];
  };
}
