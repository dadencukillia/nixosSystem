{ config, lib, ... }:

{
  systemd.user.services.dunst = {
    Unit = {
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
  };

  services.dunst = {
    enable = true;

    iconTheme = {
      package = config.gtk.iconTheme.package;
      name = config.gtk.iconTheme.name;
      size = "32x32";
    };

    settings = {
      global = {
        width = "(400,500)";
        height = "(0,300)";
        offset = "(30,30)";
        padding = 10;
        origin = "bottom-right";
        separator_height = 1;
        separator_color = "#1d2021";
        frame_width = 0;
        corner_radius = 6;
        corners = "all";
        font = "Noto Sans 12";
        background = "#3c3836";
        foreground = "#a89984";
        timeout = 5;

        mouse_left_click = "do_action";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
      };

      urgency_critical = {
        background = "#fb4934";
        foreground = "#3c3836";
        timeout = 10;
      };
    };
  };
}
