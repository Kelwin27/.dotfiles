{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix
    ols # odin

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
