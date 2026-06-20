{
  enable = true;
  settings = {
    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, Q, exec, kitty"
      "$mainMod SHIFT, X, killactive"
      "$mainMod SHIFT, M, exit"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
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
      col.active_border = "rgb(b4befe)";
      col.inactive_border = "rgb(6c7086)";

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
}
