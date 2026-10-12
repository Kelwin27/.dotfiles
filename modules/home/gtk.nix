{ pkgs, ... }:
let
  variant = "macchiato";
  accent = "mauve";
  themePackage = pkgs.catppuccin-gtk.override {
    variant = variant;
    accents = [ accent ];
    size = "standard";
    # mirrors the shape the Colloid build used to ask for, minus its palette tweak
    tweaks = [
      "rimless"
      "float"
    ];
  };
  # the upstream build derives the directory name from every knob above
  themeName = "catppuccin-${variant}-${accent}-standard+rimless,float";
in
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-color-emoji
    fantasque-sans-mono
    maple-mono.truetype-autohint
  ];

  gtk = {
    enable = true;
    font = {
      name = "Maple Mono";
      size = 12;
    };
    theme = {
      name = themeName;
      package = themePackage;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override { color = "black"; };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    gtk4 = {
      theme = {
        name = themeName;
        package = themePackage;
      };
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
