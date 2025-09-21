{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix
    ols # odin
    nodePackages."@tailwindcss/language-server" # tailwindcss
    sqls # sql

    ## formating
    shfmt
    treefmt
    nixfmt-rfc-style

    ## Python
    python3
    python312Packages.ipython

    ## Odin
    odin
  ];
}
