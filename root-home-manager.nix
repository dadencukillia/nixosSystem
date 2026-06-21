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
  vim.opt.clipboard = "unnamedplus"
  vim.opt.wrap = false

  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  local servers = {
    nixd = {
      cmd = { 'nixd' },
      root_markers = { 'flake.nix' },
      filetypes = { 'nix' },
    },
  }

  for name, opts in pairs(servers) do
    opts.on_attach = on_attach
    opts.capabilities = capabilities
    
    vim.lsp.config(name, opts)
    vim.lsp.enable(name)
  end
  '';
}
