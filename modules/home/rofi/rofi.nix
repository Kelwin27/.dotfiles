{ pkgs, ... }:
{
  # Only the binary remains, for the clipboard bind in binds.nix. The launcher
  # moved to noctalia in phase 3 and the power menu to its session panel, so the
  # rasi themes are gone. Delete this module in phase 5 along with cliphist.
  home.packages = with pkgs; [ rofi ];
}
