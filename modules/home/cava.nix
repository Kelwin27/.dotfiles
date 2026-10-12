{ ... }:
{
  programs.cava = {
    enable = true;

    settings = {
      general = {
        autosens = 1;
        overshoot = 0;
      };

      color = {
        gradient = 1;
        gradient_count = 8;

        gradient_color_1 = "'#8aadf4'";
        gradient_color_2 = "'#7dc4e4'";
        gradient_color_3 = "'#8bd5ca'";
        gradient_color_4 = "'#a6da95'";
        gradient_color_5 = "'#eed49f'";
        gradient_color_6 = "'#f5a97f'";
        gradient_color_7 = "'#ed8796'";
        gradient_color_8 = "'#c6a0f6'";
      };
    };
  };
}
