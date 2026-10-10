{ pkgs, ... }:
{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      update_ms = 500;
      rounded_corners = false;
    };
  };

  # nvtopPackages.intel builds with the intel flag alone and no NVIDIA_SUPPORT,
  # which is why it reported "No GPU to monitor" on the desktop's GTX 1650.
  home.packages = with pkgs; [ nvtopPackages.nvidia ];
}
