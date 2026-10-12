{ pkgs, ... }:
{
  programs.vscodium.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      ## Languages
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      ms-python.python
      tamasfe.even-better-toml
      golang.go

      ## Color scheme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };
}
