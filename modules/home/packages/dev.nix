{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix lsp

    ## formating
    shfmt
    shellcheck
    treefmt
    nixfmt

    ## Python
    python3
    uv
    ruff
    pyright

    ## Node
    bun

    #Go
    go
    gopls # mcp for opencode

    # Vibe Coding
    ast-grep
    yq-go
    difftastic
  ];
}
