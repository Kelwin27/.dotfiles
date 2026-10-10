{
  config,
  lib,
  host,
  ...
}:
lib.mkIf (host != "vm") {
  # The binary itself comes from programs.noctalia (environment.systemPackages),
  # which is gated on the same host list.

  # Wallpapers live in the repository and are linked into the data dir, so adding
  # one is a commit plus a rebuild rather than a manual copy. symlinked, not copied:
  # 35 MB of images should not be duplicated into the home directory.
  home.file."wallpapers" = {
    source = ../../../wallpapers/otherWallpaper/gruvbox;
    target = "${config.xdg.dataHome}/wallpapers";
    recursive = true;
  };

  xdg.configFile."noctalia/config.toml" = {
    text = lib.replaceStrings [ "@dataHome@" ] [ config.xdg.dataHome ] (
      builtins.readFile ./config.toml
    );
  };
}
