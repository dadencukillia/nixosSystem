{ config, pkgs, username, zenbrowser, ... }:

{
  imports = [
    ./fonts.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      zenbrowser
    ];

    stateVersion = "26.05";
  };

  wayland.windowManager.hyprland = import ./hyprland/hyprland.nix { term = "kitty"; };

  programs = {
    git = import ./personalOptions/git.nix;
    kitty = import ./terms/kitty/kitty.nix { inherit pkgs; };
  }; 

  programs.home-manager.enable = true;
}
