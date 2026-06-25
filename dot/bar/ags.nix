{ inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./ags;
    
    extraPackages = with inputs.astal.packages.${pkgs.system}; [
      hyprland
      tray
      bluetooth
      network
      mpris
      wireplumber
    ];
  };
}
