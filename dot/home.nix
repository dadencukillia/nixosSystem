{ config, pkgs, username, zenbrowser, ... }:

{
  imports = [
    ./fonts.nix
    ./nvim/nvim.nix
    ./personalOptions/git.nix
    ./terms/kitty/kitty.nix
    ./hyprland/hyprland.nix
  ];

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
