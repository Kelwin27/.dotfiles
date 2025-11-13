{ pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.nix;

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://hyprland.cachix.org"
        "https://ghostty.cachix.org"
        "https://ollama.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
        "ollama.cachix.org-1:+8gHyhs2wZvI/0A7kujPWiPM4LlgFjEKhcOvl5n9jss="
      ];
    };
  };
  nixpkgs = {
    overlays = [ inputs.nur.overlays.default ];
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
    nix-output-monitor # Processes output of Nix commands to show helpful and pretty information
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

  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.fantasque-sans-mono
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
