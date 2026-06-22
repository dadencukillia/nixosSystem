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

  programs.nvchad.extraPackages = with pkgs; [
    nixd
  ];

  programs.nvchad.extraConfig = ''
    vim.opt.wrap = false
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    vim.lsp.config("nixd", {
      cmd = { 'nixd' },
      root_markers = { 'flake.nix' },
      filetypes = { 'nix' },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable("nixd")
  '';
}
