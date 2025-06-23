{ pkgs, lib, ... }: 
let
  options = import ./options.nix;
  theme = import ./theme.nix;
in
{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings.vim = lib.mkMerge [
        options
        theme
        {
          viAlias = false;
          vimAlias = true;
          lsp = {
            enable = true;
          };
        }
      ];
    };
}
