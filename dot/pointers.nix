{ lib, pkgs, ... }:

{
  home.sessionVariables = lib.mkDefault {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "16";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "16";
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 16;
    gtk.enable = true;
    hyprcursor = {
      enable = true;
      size = 16;
    };
  };
}
