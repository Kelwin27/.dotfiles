{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    telegram-desktop
  ];
}
