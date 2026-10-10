{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./exec-once.nix
    ./config.nix
    ./binds.nix
    ./windowrules.nix
    ./variables.nix
  ];
}
