{ inputs, pkgs, ... }:
let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
