{ pkgs, ... }:

{
  programs.direnv.enable = true;
  home.packages = with pkgs; [
    gnumake
  ];
}
