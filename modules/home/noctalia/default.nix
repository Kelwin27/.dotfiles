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

  # The laptop has no disk to report. The marker now sits between two other
  # members of the metrics capsule, so it carries its own trailing separator
  # instead of spanning a whole list entry.
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
