{ config, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          path = "${config.home.homeDirectory}/.config/hypr/images/wallpaper.jpg";
          zindex = -2;
        }
      ];

      shape = [
        {
          size = "300, 128";
          color = "rgb(282828)";
          border_size = 2;
          border_color = "rgb(d79921)";
          rounding = 6;
          zindex = -1;
        }

        {
          rounding = 8;
          size = "8, 8";
          position = "-138, 52";
          color = "rgb(fb4934)";
        }

        {
          rounding = 8;
          size = "8, 8";
          position = "-125, 52";
          color = "rgb(fe8019)";
        }

        {
          rounding = 8;
          size = "8, 8";
          position = "-112, 52";
          color = "rgb(b8bb26)";
        }
      ];

      input-field = [
        {
          rounding = 6;
          position = "0, -24";
          size = "250, 40";
          outline_thickness = 0;
          fade_on_empty = false;
          placeholder_text = "$LAYOUT";
          fail_text = "$FAIL <b>$ATTEMPTS</b>";
          fail_color = "rgb(fb4934)";
          check_color = "rgb(504945)";
          inner_color = "rgb(3c3836)";
          font_color = "rgb(fbf1c7)";
        }
      ];

      label = [
        {
          position = "0, 52";
          text = "$USER";
          font_size = 12;
          color = "rgb(d5c4a1)";
        }

        {
          position = "20, -20";
          text = "$TIME";
          font_family = "JetBrainsMono Nerd Font Mono Bold";
          font_size = 24;
          halign = "left";
          valign = "top";
          color = "rgb(fe8019)";
        }
      ];
    };
  };
}
