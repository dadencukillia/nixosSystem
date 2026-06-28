{ config, lib, pkgs, inputs, ... }:

{
  options = {
    custom.nvchad = {
      chadrcConfig = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        example = ''
          M.base46 = {
            theme = "gruvbox",
          }

          M.ui = {
            theme = "gruvbox",
            transparency = true,
          }
        '';
        description = ''
          Custom vimrc lines.
          This config replaces the chadrc.lua file.
          `local M = {}` is already here at the top,
          and `return M` is already here at the bottom.
        '';
      };
      extraConfig = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = ''
          These config are loaded after nvchad in the end of init.lua in starter
        '';
      };
      extraPlugins = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        example = ''
          { "equalsraf/neovim-gui-shim", lazy = false },
          { "nvim-lua/plenary.nvim" },
          {
            "xeluxee/competitest.nvim",
            dependencies = "MunifTanjim/nui.nvim",
            config = function() require("competitest").setup() end,
          },
        '';
        description = ''
          The extra plugins you want to install.
          That's a part of lazy.nvim config.
          return { *your text here* }
        '';
      };
    };
  };

  imports = [ inputs.nvchad.homeManagerModules.default ];

  config = {
    custom.nvchad = {
      chadrcConfig = [''
        M.base46 = {
          theme = "gruvbox",
        }

        M.ui = {
          theme = "gruvbox",
          transparency = true,
        }
      ''];

      extraConfig = [''
        vim.g.clipboard = "wl-copy"
        vim.opt.clipboard = "unnamedplus"
        vim.opt.wrap = false
      ''];
    };

    programs.nvchad = {
      enable = true;
      backup = false;
      extraPackages = with pkgs; [
        wl-clipboard
      ];
      chadrcConfig = let 
        chadrcConfigStr = lib.concatStringsSep "\n" config.custom.nvchad.chadrcConfig;
      in lib.mkForce ''
        ---@type ChadrcConfig
        local M = {}

        ${ chadrcConfigStr }

        return M
      '';

      extraConfig = lib.mkForce (lib.concatStringsSep "\n" config.custom.nvchad.extraConfig);

      extraPlugins = let 
        extraPluginsStr = lib.concatStringsSep ",\n" config.custom.nvchad.extraPlugins;
      in lib.mkForce ''
        return {
          ${ extraPluginsStr }
        }
      '';
    };
  };
}
