{ config, pkgs, username, zenbrowser, ... }:

{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      kitty
      zenbrowser
    ];

    stateVersion = "26.05";
  };

  wayland.windowManager.hyprland = import ./hyprland/hyprland.nix;

  programs = {
    git = import ./personalOptions/git.nix;
    kitty = import ./ricePrograms/kitty.nix;
  }; 

  programs.home-manager.enable = true;
}
