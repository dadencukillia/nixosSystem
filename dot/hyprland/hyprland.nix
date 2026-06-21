{ pkgs, ... }:

{
  home.packages = with pkgs; [
    playerctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, W, exec, zen"
        "$mod, E, exec, thunar"

        "$mod SHIFT, X, killactive"
        "$mod SHIFT, M, exit"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.5"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      general = {
        border_size = 2;
        gaps_in = 10;
        gaps_out = 10;
        gaps_workspaces = 10;
        "col.active_border" = "rgb(d79921)";
        "col.inactive_border" = "rgba(00000000)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 6;
        dim_inactive = false;

        blur = {
          enabled = true;
          size = 7;
          passes = 3;
          new_optimizations = true;
          noise = 0.05;
        };
      };

      animations.enabled = true;

      input = {
        kb_layout = "us,ua";
        kb_variant = "";
        kb_options = "grp:alt_shift_toggle";
        repeat_rate = 25;
        repeat_delay = 500;
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          drag_lock = true;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        middle_click_paste = false;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      exec-once = [
        "hyprctl setcursor Bibata-Modern-Classic 16"
      ];

      monitor = [
        ",highres,auto,1"
      ];
    };
  };
}
