{ lib, ... }:
let
  inherit (lib.generators) mkLuaInline;
in
{
  dashboard.alpha = {
    enable = true;
    theme = "dashboard";
  };
}
