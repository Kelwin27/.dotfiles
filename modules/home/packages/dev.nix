{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix
    ols # odin

    ## formating
    shfmt
    treefmt
    nixfmt

    ## Python
    python3
    python312Packages.ipython

    ## Odin
    odin

    #Go
    go
    gcc
  ];
}
