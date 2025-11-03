{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.blacklistedKernelModules = [
    "nouveau"
    "nvidiafb"
  ];

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  # boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit # Для CUDA
    cudaPackages.cudnn # Для ускорения нейронных сетей
  ];

  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.cudaCapabilities = [ "7.5" ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver # Для аппаратного декодирования видео
        libva-vdpau-driver
        libvdpau
      ];
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable; # Стабильные драйверы
      open = false; # Проприетарные драйверы
      modesetting.enable = true; # Для Wayland и Hyprland
      powerManagement.enable = true; # Энергосбережение
      powerManagement.finegrained = false; # Не поддерживается на GTX 1650
      nvidiaSettings = true; # Для утилиты nvidia-settings
    };

    enableRedistributableFirmware = true;
  };

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # Для Wayland
    OLLAMA_CUDA_ENABLED = "1"; # Для Ollama
  };
}
