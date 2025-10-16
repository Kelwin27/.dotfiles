{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  boot.blacklistedKernelModules = [ "nouveau" ];
  environment.systemPackages = with pkgs; [
    cudatoolkit # Для CUDA
    cudaPackages.cudnn # Для ускорения нейронных сетей
  ];
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  environment.variables = {
    OLLAMA_CUDA_ENABLED = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    CUDA_PATH = "${pkgs.cudatoolkit}";
    LD_LIBRARY_PATH = "${pkgs.cudatoolkit}/lib64:${pkgs.cudaPackages.cudnn}/lib";
  };
}
