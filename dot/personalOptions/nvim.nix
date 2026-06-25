{ pkgs, ... }:

{
  programs.nvchad.extraConfig = ''
    -- copied from dot/editor/nvim.nix
    vim.g.clipboard = "wl-copy"
    vim.opt.clipboard = "unnamedplus"
    vim.opt.wrap = false
    -- copy end

    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities
  '';

  programs.nvchad.extraPlugins = ''
    return {
      { 'wakatime/vim-wakatime', lazy = false },
    }
  '';
}
