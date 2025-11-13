{ pkgs, ... }:

let
  waypaper-light = pkgs.waypaper.overrideAttrs (old: {
    python3Packages = pkgs.python3.withPackages (ps: [
      ps.imageio-core # preview (JPG/PNG)
      ps.pycairo # graphic
      ps.pygobject # GTK
    ]);
  });
in
{
  home.packages = with pkgs; [ waypaper-light ];

  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = ~/Pictures/wallpapers/others
    monitors = All
    wallpaper = ~/Pictures/wallpapers/others/nixos.png
    backend = swww
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    show_hidden = False
    show_gifs_only = False
    post_command = pkill .waypaper-wrapp
    number_of_columns = 3
    swww_transition_type = any
    swww_transition_step = 90
    swww_transition_angle = 0
    swww_transition_duration = 2
    swww_transition_fps = 60
    use_xdg_state = False
  '';
}
