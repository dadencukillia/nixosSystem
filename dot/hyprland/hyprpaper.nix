{ config, ... }:

{
  systemd.user.services.hyprpaper = {
    Unit = {
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${config.home.homeDirectory}/.config/hypr/images/wallpaper.jpg" ];
      wallpaper = [ 
        {
          monitor = "";
          path = "${config.home.homeDirectory}/.config/hypr/images/wallpaper.jpg";
        }
      ];
    };
  };
}
