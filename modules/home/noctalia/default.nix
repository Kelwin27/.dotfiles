{
  lib,
  host,
  ...
}:
lib.mkIf (host != "vm") {
  # The binary itself comes from programs.noctalia (environment.systemPackages),
  # which is gated on the same host list.
  xdg.configFile."noctalia/config.toml".source = ./config.toml;
}