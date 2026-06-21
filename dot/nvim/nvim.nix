{ lib, pkgs, nvchad, ... }:

{
  imports = [ nvchad.homeManagerModules.default ];

  programs.nvchad = {
    enable = true;
    chadrcConfig = ''
      ---@type ChadrcConfig
      local M = {}

      M.base46 = {
        theme = "gruvbox",
      }

      M.ui = {
        theme = "gruvbox",
        transparency = true,
      }

      return M
    '';
    extraConfig = lib.mkDefault ''
      vim.opt.clipboard = "unnamedplus"
      vim.opt.wrap = false
    '';
  };
}
