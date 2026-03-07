{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nil # nix (лёгкий LSP вместо nixd, экономия ~500MB)
    #ols # odin

    ## formating
    shfmt
    treefmt
    nixfmt

    ## Python
    python3
    python312Packages.ipython

    ## Odin
    #odin

    #Go
    go
    # gcc
  ];
}
