username:
{ privatePkg, lib, pkgs, inputs, ... }:

{
  imports = [
    ./fonts.nix
    ./pointers.nix
    ./theme.nix
    ./mimeapps.nix
    ./editor/nvim.nix
    ./terminals/kitty/kitty.nix
    ./hyprland/hyprland.nix
    ./shell/shell.nix
    ./launcher/rofi.nix
    ./notifications/dunst.nix
    ./bar/ags.nix
    ./software/software.nix
  ]
  # keep here your private adjustments:
  ++ lib.optional (builtins.pathExists privatePkg) privatePkg;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = [
      inputs.zenbrowser.packages.${pkgs.system}.default
    ];

    stateVersion = "26.05";
  };

  gtk.enable = true;
  programs.home-manager.enable = true;
}
