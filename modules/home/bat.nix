{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Nord";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      # batgrep
      # batdiff
    ];
  };
}
