{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetbrainsMono Nerd Font:size=9";
        include = "${pkgs.foot.themes}/share/foot/themes/gruvbox-dark";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
