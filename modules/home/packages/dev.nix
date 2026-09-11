{ pkgs, ... }:
let
  bun-baseline = pkgs.stdenvNoCC.mkDerivation {
    pname = "bun";
    version = "latest-baseline";

    src = pkgs.fetchzip {
      url = "https://github.com/oven-sh/bun/releases/latest/download/bun-linux-x64-baseline.zip";
      sha256 = "sha256-Nq85/hrOkT7M4VJ9Uc7Kr9e+uNx8unD4d30RzaQlYxc=";
      # sha256 = pkgs.lib.fakeSha256; # for hash
    };

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      cp $src/bun $out/bin/bun
      chmod +x $out/bin/bun

      runHook postInstall
    '';

    meta = {
      mainProgram = "bun";
      description = "Bun baseline (no AVX2) from latest release";
    };
  };
in
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

    ## Odin
    #odin

    ## Node
    bun-baseline

    #Go
    go

    # Vibe Coding
    opencode
  ];
}
