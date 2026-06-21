{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, Q, exec, kitty"
        "$mod SHIFT, X, killactive"
        "$mod SHIFT, M, exit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      monitor = [
        ",highres,auto,1"
      ];

      input = {
        kb_layout = "us,ua";
        kb_variant = "";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
	  drag_lock = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        "col.active_border" = "rgb(b4befe)";
        "col.inactive_border" = "rgb(6c7086)";

        layout = "dwindle";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 0;
        dim_inactive = false;
        dim_strength = 0.3;
        dim_around = 0.5;

        blur = {
          enabled = true;
          size = 7;
          passes = 3;
          new_optimizations = true;
        };
      };
    };
  };
}
