{ config, pkgs, username, zenbrowser, ... }:

{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      kitty
      zenbrowser
    ];

    programs = {
      git = import ./personalOptions/git.nix;
      kitty = import ./ricePrograms/kitty.nix;
    };

    wayland.windowManager.hyprland = {
      enable = true;
    };

    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
