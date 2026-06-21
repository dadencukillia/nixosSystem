{ pkgs, nvchad, ... }:

{
  imports = [ nvchad.homeManagerModules.default ];

  programs.nvchad = {
    enable = true;
    chadrcConfig = ''
      ---@type ChadrcConfig
      local M = {}

      M.ui = {
        theme = "gruvbox",
        transparency = true,
      }

      return M
    '';
  };
}
