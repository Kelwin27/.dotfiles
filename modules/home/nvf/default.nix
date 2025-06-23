{ pkgs, lib, ... }:
let
  options = import ./options.nix;
  theme = import ./theme.nix;
  treesitter = import ./treesitter.nix;
  lang = import ./languages.nix;
  lsp = import ./lsp.nix;
  util = import ./utility.nix;
in
{
  programs.nvf = {
    enable = true;

    settings.vim = lib.mkMerge [
      options
      theme
      treesitter
      lang
      lsp
      util
      {
        viAlias = false;
        vimAlias = true;
        autocomplete.blink-cmp = {
          enable = true;
        };
      }
    ];
  };
}
