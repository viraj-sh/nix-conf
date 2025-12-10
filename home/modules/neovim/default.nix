{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];
  programs.nixvim = {
    enable = true;

    config = {
      defaultEditor = true;
      vimdiffAlias = true;

      plugins = {
        telescope.enable = true;
        treesitter.enable = true;
        luasnip.enable = true;

        lsp = {
          enable = true;
          servers = {
            lua-ls.enable = true;
          };
        };

        nvim-cmp = {
          enable = true;
          autoEnableSources = true;
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
        };
      };

      options = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
      };

      globals.mapleader = " ";

      keymaps = [
        {
          action = "<cmd>Telescope live_grep<CR>";
          key = "<leader>g";
        }
      ];
    };
  };
}
