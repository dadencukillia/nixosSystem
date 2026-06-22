{ lib, pkgs, nvchad, ... }:

{
  imports = [ nvchad.homeManagerModules.default ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      wl-clipboard
    ];
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
      vim.g.clipboard = "wl-copy"
      vim.opt.clipboard = "unnamedplus"
      vim.opt.wrap = false
    '';
  };
}
