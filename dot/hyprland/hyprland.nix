{ pkgs, ... }:

{
  home.packages = with pkgs; [
    playerctl
    brightnessctl
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
        "$mod, SPACE, exec, rofi -show drun"

        "$mod SHIFT, X, killactive"
        "$mod SHIFT, M, exit"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod, minus, workspace, e-1"
        "$mod, Equal, workspace, e+1"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, minus, movetoworkspace, e-1"
        "$mod SHIFT, Equal, movetoworkspace, e+1"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, V, togglefloating"
        "$mod, P, pin"

        "SUPER, D, togglespecialworkspace, apps"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.5"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
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

      animations = {
        enabled = true;

        bezier = [
        "easeSlide, 0, 1.02, 0.51, 0.93"
        ];

        animation = [
          "specialWorkspaceIn, 1, 5, easeSlide, slide bottom"
          "specialWorkspaceOut, 1, 4, easeSlide, slide top"
        ];
      };

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

      dwindle = {
        special_scale_factor = 0.95;
      };

      monitor = [
        ",highres,auto,1"
      ];
    };
  };
}
