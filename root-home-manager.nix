{ lib, pkgs, ... }:

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
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    lsp.config("nixd", {
      cmd = { 'nixd' },
      root_markers = { 'flake.nix' },
      filetypes = { 'nix' },
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lsp.enable("nixd")
  '';
}
