{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waypaper
    swaybg
  ];

  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = ~/Pictures/wallpapers/others
    monitors = All
    wallpaper = ~/Pictures/wallpapers/others/a-mirage-in-the-distance-99-5120x2880.jpg
    backend = swaybg
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    show_hidden = False
    show_gifs_only = False
    post_command = pkill .waypaper-wrapp
    number_of_columns = 3
    transition_type = fade
    transition_duration = 2
    transition_fps = 60
    use_xdg_state = False
  '';
}
