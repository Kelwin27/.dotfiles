{
  config,
  lib,
  host,
  ...
}:
lib.mkIf (host != "vm") {
  home.file."wallpapers" = {
    source = ../../../wallpapers/otherWallpaper/gruvbox;
    target = "${config.xdg.dataHome}/wallpapers";
    recursive = true;
  };

  xdg.configFile."noctalia/config.toml" = {
    text =
      lib.replaceStrings
        [ "@dataHome@" "@diskWidget@" ]
        [
          config.xdg.dataHome
          (if host == "desktop" then "\"disk\", " else "")
        ]
        (builtins.readFile ./config.toml);
  };
}
