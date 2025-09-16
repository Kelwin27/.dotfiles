{ pkgs, lib, ... }:
let
  options = import ./options.nix;
  theme = import ./theme.nix;
  treesitter = import ./treesitter.nix { inherit pkgs; };
  lang = import ./languages.nix;
  lsp = import ./lsp.nix;
  util = import ./utility.nix;
  dashboard = import ./dashboard.nix { inherit pkgs lib; };
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
      dashboard
      {
        viAlias = false;
        vimAlias = true;
        autocomplete.blink-cmp = {
          enable = true;
        };
        autopairs.nvim-autopairs = {
          enable = true;
        };
        telescope.enable = true;
      }
    ];
  };
}
