{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  browser = "zen-beta";
  terminal = "ghostty";
  j = builtins.toJSON;

  key = mods: name: lua ''"${lib.concatStringsSep " + " (mods ++ [ name ])}"'';

  bind = mods: name: dsp: {
    _args = [
      (key mods name)
      dsp
    ];
  };

  bindWith = opts: mods: name: dsp: {
    _args = [
      (key mods name)
      dsp
      opts
    ];
  };

  exec = cmd: lua "hl.dsp.exec_cmd(${j cmd})";
  execWith = cmd: rules: lua "hl.dsp.exec_cmd(${j cmd}, { ${rules} })";

  focusDir = d: lua "hl.dsp.focus({ direction = ${j d} })";
  focusWs = w: lua "hl.dsp.focus({ workspace = ${j w} })";
  focusWin = w: lua "hl.dsp.focus({ window = ${j w} })";

  moveDir = d: lua "hl.dsp.window.move({ direction = ${j d} })";
  moveWs =
    w: follow:
    lua "hl.dsp.window.move({ workspace = ${j w}${if follow then "" else ", follow = false"} })";
  moveBy = x: y: lua "hl.dsp.window.move({ x = ${x}, y = ${y}, relative = true })";
  resizeBy = x: y: lua "hl.dsp.window.resize({ x = ${x}, y = ${y}, relative = true })";

  alterTop = lua ''hl.dsp.window.alter_zorder({ mode = "top" })'';
  fullscreen = lua ''hl.dsp.window.fullscreen({ mode = "fullscreen" })'';
  maximized = lua ''hl.dsp.window.fullscreen({ mode = "maximized" })'';
  killActive = lua "hl.dsp.window.kill()";
  pseudo = lua "hl.dsp.window.pseudo()";
  toggleSplit = lua ''hl.dsp.layout("togglesplit")'';
  drag = lua "hl.dsp.window.drag()";
  mouseResize = lua "hl.dsp.window.resize()";

  floatSize = ''float = true, size = "1111 700"'';

  mediaBind = name: cmd: bindWith { locked = true; } [ ] name (exec cmd);

  arrows = [
    {
      name = "left";
      dir = "left";
    }
    {
      name = "right";
      dir = "right";
    }
    {
      name = "up";
      dir = "up";
    }
    {
      name = "down";
      dir = "down";
    }
    {
      name = "h";
      dir = "left";
    }
    {
      name = "j";
      dir = "down";
    }
    {
      name = "k";
      dir = "up";
    }
    {
      name = "l";
      dir = "right";
    }
  ];

  dx =
    dir:
    if dir == "left" then
      "-80"
    else if dir == "right" then
      "80"
    else
      "0";
  dy =
    dir:
    if dir == "up" then
      "-80"
    else if dir == "down" then
      "80"
    else
      "0";

  workspaces = lib.range 1 10;
  wsKey = n: if n == 10 then "0" else toString n;
in
{
  wayland.windowManager.hyprland.settings.bind = [
    (bind [ "SUPER" ] "F1" (exec "show-keybinds"))

    (bind [ "SUPER" ] "RETURN" (exec terminal))
    (bind [ "ALT" ] "RETURN" (execWith terminal floatSize))
    (bind [ "SUPER" "SHIFT" ] "RETURN" (execWith terminal "fullscreen = true"))
    (bind [ "SUPER" ] "B" (exec browser))
    (bind [ "SUPER" "SHIFT" ] "B" (exec "chromium"))
    (bind [ "SUPER" "SHIFT" ] "V" (exec "codium"))
    (bind [ "SUPER" ] "Q" killActive)
    (bind [ "SUPER" ] "F" fullscreen)
    (bind [ "SUPER" "SHIFT" ] "F" maximized)
    (bind [ "SUPER" ] "SPACE" (exec "toggle-float"))
    (bind [ "SUPER" ] "D" (exec "noctalia msg panel-toggle launcher"))
    (bind [ "SUPER" "SHIFT" ] "S" (execWith "SoundWireServer" ''workspace = "5 silent"''))
    (bind [ "SUPER" ] "Escape" (exec "noctalia msg session lock"))
    (bind [ "SUPER" "SHIFT" ] "D" (
      exec "vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
    ))
    (bind [ "SUPER" "SHIFT" ] "Escape" (exec "noctalia msg panel-toggle session"))
    (bind [ "SUPER" ] "P" pseudo)
    (bind [ "SUPER" ] "X" toggleSplit)
    (bind [ "SUPER" ] "T" (exec "toggle-opacity"))
    (bind [ "SUPER" ] "E" (exec "${terminal} --title=files -e yazi"))
    (bind [ "ALT" ] "E" (execWith "${terminal} --title=files -e yazi" floatSize))
    (bind [ "SUPER" "SHIFT" ] "M" (exec "toggle-resources"))
    (bind [ "SUPER" "SHIFT" ] "T" (exec "noctalia msg bar-toggle"))
    (bind [ "SUPER" ] "C" (exec "hyprpicker -a"))
    (bind [ "SUPER" ] "W" (exec "noctalia msg panel-toggle wallpaper"))
    (bind [ "SUPER" "SHIFT" ] "W" (exec "noctalia msg wallpaper-random"))
    (bind [ "SUPER" ] "N" (exec "noctalia msg panel-toggle notifications"))
    (bind [ "SUPER" ] "EQUAL" (exec "woomer"))

    (bind [ ] "PRINT" (exec "noctalia msg screenshot-region"))
  ]
  ++ map (a: bind [ "SUPER" ] a.name (focusDir a.dir)) arrows
  ++ map (a: bind [ "SUPER" ] a.name alterTop) arrows
  ++ [
    (bind [ "CTRL" "ALT" ] "up" (focusWin "floating"))
    (bind [ "CTRL" "ALT" ] "down" (focusWin "tiled"))
  ]
  ++ map (n: bind [ "SUPER" ] (wsKey n) (focusWs n)) workspaces
  ++ map (n: bind [ "SUPER" "SHIFT" ] (wsKey n) (moveWs n false)) workspaces
  ++ [ (bind [ "SUPER" "CTRL" ] "c" (moveWs "empty" true)) ]
  ++ map (a: bind [ "SUPER" "SHIFT" ] a.name (moveDir a.dir)) arrows
  ++ map (a: bind [ "SUPER" "CTRL" ] a.name (resizeBy (dx a.dir) (dy a.dir))) arrows
  ++ map (a: bind [ "SUPER" "ALT" ] a.name (moveBy (dx a.dir) (dy a.dir))) arrows
  ++ [
    (bind [ ] "XF86AudioPlay" (exec "playerctl play-pause"))
    (bind [ ] "XF86AudioNext" (exec "playerctl next"))
    (bind [ ] "XF86AudioPrev" (exec "playerctl previous"))
    (bind [ ] "XF86AudioStop" (exec "playerctl stop"))

    (bind [ "SUPER" ] "mouse_down" (focusWs "e-1"))
    (bind [ "SUPER" ] "mouse_up" (focusWs "e+1"))

    (bind [ "SUPER" ] "V" (exec "noctalia msg panel-toggle clipboard"))

    (mediaBind "XF86AudioMute" "noctalia msg volume-mute")
    (mediaBind "XF86AudioRaiseVolume" "noctalia msg volume-up")
    (mediaBind "XF86AudioLowerVolume" "noctalia msg volume-down")
    (mediaBind "XF86MonBrightnessUp" "noctalia msg brightness-up")
    (mediaBind "XF86MonBrightnessDown" "noctalia msg brightness-down")

    (bindWith { mouse = true; } [ "SUPER" ] "mouse:272" drag)
    (bindWith { mouse = true; } [ "SUPER" ] "mouse:273" mouseResize)
  ];
}
