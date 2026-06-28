{ pkgs, ... }:

{
  imports = [
    ./dot/editor/nvim.nix
  ];

  config = {
    home = {
      username = "root";
      homeDirectory = "/root";
      stateVersion = "26.05";
    };

    programs.nvchad.extraPackages = [
      pkgs.nixd
    ];

    custom.nvchad.extraConfig = [''
      vim.opt.wrap = false

      vim.lsp.config.nixd = {
        cmd = { 'nixd' },
        root_markers = { 'flake.nix' },
        filetypes = { 'nix' },
      }
      vim.lsp.enable("nixd")
    ''];

    custom.nvchad.extraPlugins = [''
      {
        "nvim-tree/nvim-tree.lua",
        opts = {
          git = {
            enable = true,
            ignore = false,
          },
        },
      }
    ''];
  };
}
