{ ags, astal, pkgs, ... }:

{
  imports = [ ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./ags;
    
    extraPackages = [
      astal.packages.${pkgs.system}.hyprland
    ];
  };
}
