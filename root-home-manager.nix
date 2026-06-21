{ pkgs, ... }:

{
  imports = [
    ./dot/nvim/nvim.nix
  ];

  home = {
    username = "root";
    homeDirectory = "/root";
    stateVersion = "26.05";
  };
}
