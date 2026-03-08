{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nil # nix
    #ols # odin

    ## formating
    shfmt
    treefmt
    nixfmt

    ## Python
    python3
    #python312Packages.ipython

    ## Odin
    #odin

    #Go
    go
    # gcc
  ];
}
