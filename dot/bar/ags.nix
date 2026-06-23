{ ags, astal, pkgs, ... }:

{
  imports = [ ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./ags;
    
    extraPackages = [
      astal.packages.${pkgs.system}.hyprland
      astal.packages.${pkgs.system}.tray
      astal.packages.${pkgs.system}.bluetooth
      astal.packages.${pkgs.system}.network
      astal.packages.${pkgs.system}.mpris
      astal.packages.${pkgs.system}.wireplumber
    ];
  };
}
