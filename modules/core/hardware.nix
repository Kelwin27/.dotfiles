{
  config,
  pkgs,
  lib,
  ...
}:
let
  nvidiaVersion = "595.71.05";
  driverPath = "/home/kelwin/.cache/nvidia/NVIDIA-Linux-x86_64-${nvidiaVersion}.run";

  customNvidia = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = nvidiaVersion;
    sha256_64bit = "0z1s4424hp3mvlknglyirdd9j4xix9kz79r0vap8hgdn8mjpxkwb";
    openSha256 = lib.fakeSha256;
    settingsSha256 = lib.fakeSha256;
    persistencedSha256 = lib.fakeSha256;
  };
in
{
  boot.blacklistedKernelModules = [
    "nouveau"
    "nvidiafb"
  ];

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    #"nvidia_uvm"
    "nvidia_drm"
  ];

  #environment.systemPackages = with pkgs; [
  #  cudaPackages.cudatoolkit # for cuda
  #  cudaPackages.cudnn # speed llm
  #];

  #nixpkgs.config.cudaSupport = true;
  #nixpkgs.config.cudaCapabilities = [ "7.5" ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver # for apparate decode video
        libva-vdpau-driver
        libvdpau
      ];
    };

    nvidia = {
      package = lib.mkForce customNvidia;
      open = false; # proprietar drivers
      modesetting.enable = true; # For Wayland and Hyprland
      powerManagement.enable = true;
      powerManagement.finegrained = false; # don't support GTX 1650
      nvidiaSettings = true; # utils for nvidia-settings
    };

    enableRedistributableFirmware = true;
  };

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # Wayland
    #OLLAMA_CUDA_ENABLED = "1"; # Ollama
  };
}
