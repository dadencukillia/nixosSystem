{ pkgs, ... }:

{
  home.file = {
    ".config/rofi/images/cover.jpg".source = ./cover.jpg;
  };

  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofi-emoji ];
    terminal = "kitty";
    theme = ./style.rasi;
  };
}
