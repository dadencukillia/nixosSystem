{ pkgs, username, zenbrowser, ... }:

{
  imports = [
    ./fonts.nix
    ./pointers.nix
    ./theme.nix
    ./nvim/nvim.nix
    ./personalOptions/git.nix
    ./terms/kitty/kitty.nix
    ./hyprland/hyprland.nix
    ./shell/shell.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      zenbrowser
    ];

    stateVersion = "26.05";
  };

  gtk.enable = true;
  programs.home-manager.enable = true;
}
