{ config, pkgs, username, zenbrowser, ... }:

{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      zenbrowser
    ];

    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
