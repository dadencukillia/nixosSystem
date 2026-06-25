{ username, zenbrowser, ... }:

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

    ./personalOptions/personalOptions.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = [
      zenbrowser
    ];

    stateVersion = "26.05";
  };

  gtk.enable = true;
  programs.home-manager.enable = true;
}
