{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprpicker ];

  xdg.desktopEntries = {
    "hyprpicker" = {
      name = "Hyprpicker";
      exec = "sh -c \"sleep 1s && hyprpicker -a -f hex\"";
      icon = "${ config.gtk.iconTheme.package }/share/icons/Adwaita/scalable/mimetypes/x-office-drawing.svg";
      terminal = false;
      type = "Application";
      categories = [ "Utility" ];
    };
  };
}
