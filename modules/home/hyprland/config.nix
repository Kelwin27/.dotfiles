{ ... }:
let
  bezier = x1: y1: x2: y2: [
    [
      x1
      y1
    ]
    [
      x2
      y2
    ]
  ];

  curve = name: points: {
    _args = [
      name
      {
        type = "bezier";
        inherit points;
      }
    ];
  };
in
{
  wayland.windowManager.hyprland.settings = {
    monitor = {
      output = "";
      mode = "preferred";
      position = "auto";
      scale = "auto";
    };

    config = {
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 0;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        touchpad.natural_scroll = true;
      };

      general = {
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 6;
        border_size = 2;
        col = {
          active_border = "rgb(8AADF4)";
          inactive_border = "0x00000000";
        };
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        enable_swallow = true;
        focus_on_activate = true;
        on_focus_under_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations.enabled = true;

      binds.movefocus_cycles_fullscreen = true;

      xwayland.force_zero_scaling = true;
    };

    curve = [
      (curve "fluent_decel" (bezier 0 0.2 0.4 1))
      (curve "easeOutCirc" (bezier 0 0.55 0.45 1))
      (curve "easeOutCubic" (bezier 0.33 1 0.68 1))
      (curve "fade_curve" (bezier 0 0.55 0.45 1))
      (curve "easeOutQuint" (bezier 0.23 1 0.32 1))
      (curve "almostLinear" (bezier 0.5 0.5 0.75 1.0))
      (curve "quick" (bezier 0.15 0 0.1 1))
    ];

    animation = [
      {
        leaf = "windows";
        enabled = true;
        speed = 3.79;
        bezier = "easeOutQuint";
      }
      {
        leaf = "windowsIn";
        enabled = true;
        speed = 4.1;
        bezier = "easeOutQuint";
        style = "popin 87%";
      }
      {
        leaf = "windowsOut";
        enabled = true;
        speed = 1.49;
        bezier = "linear";
        style = "popin 87%";
      }
      {
        leaf = "windowsMove";
        enabled = true;
        speed = 3.79;
        bezier = "easeOutQuint";
      }

      {
        leaf = "fadeIn";
        enabled = true;
        speed = 1.73;
        bezier = "almostLinear";
      }
      {
        leaf = "fadeOut";
        enabled = true;
        speed = 1.46;
        bezier = "almostLinear";
      }
      {
        leaf = "fade";
        enabled = true;
        speed = 3.03;
        bezier = "quick";
      }
      {
        leaf = "fadeSwitch";
        enabled = false;
      }
      {
        leaf = "fadeShadow";
        enabled = true;
        speed = 5;
        bezier = "easeOutCirc";
      }
      {
        leaf = "fadeDim";
        enabled = true;
        speed = 4;
        bezier = "fluent_decel";
      }
      {
        leaf = "layers";
        enabled = true;
        speed = 3.81;
        bezier = "easeOutQuint";
      }
      {
        leaf = "workspaces";
        enabled = true;
        speed = 2;
        bezier = "easeOutCubic";
        style = "fade";
      }
    ];
  };
}
