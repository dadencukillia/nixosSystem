{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "gruvbox-dark";
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 11;
      disable_ligatures = "never";
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      cursor_trail = 250;
      confirm_os_window_close = 0;
      window_padding_width = "15 10 15 10";
    };
  };
}
