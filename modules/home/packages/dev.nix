{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nixd # nix
    metals # scala
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

    ## Scala
    scala
    jdk17
    sbt
  ];
}
