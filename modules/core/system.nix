{ pkgs, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        #"https://ollama.cachix.org"
        "https://cache.nixos-cuda.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        #"ollama.cachix.org-1:+8gHyhs2wZvI/0A7kujPWiPM4LlgFjEKhcOvl5n9jss="
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    nvd # Nix/NixOS package version diff tool
    nix-du # Tool to determine which gc-roots take space in your nix store
    nix-btm # Bottom-like system monitor for nix
    nix-web # Web interface for the Nix store
    nix-tree # Interactively browse a Nix store paths dependencies
    nix-melt # Ranger-like flake.lock viewer
    nixtract # A CLI tool to extract the graph of derivations from a Nix flake
  ];

  time.timeZone = "Europe/Moscow";
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8"; # Основной язык
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8" # Дополнительный язык
    ];
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
