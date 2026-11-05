{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    lazygit
    nixd
    alejandra
    lua-language-server
    ruff
    stylua
    ty
    shfmt
    bash-language-server
    gersemi
    neocmakelsp
    vscode-css-languageserver
    biome
    dockerfmt
    docker-language-server
    superhtml
    prettier
    vscode-json-languageserver
    sqruff
    sqls
    tombi
    lemminx
    yaml-language-server
    typescript-language-server
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # keymaps
        keymaps = [
          {
            key = "<leader>ff";
            mode = "n";
            silent = true;
            action = "<cmd>FzfLua files<CR>";
          }
          {
            key = "<leader>fg";
            mode = "n";
            silent = true;
            action = "<cmd>FzfLua live_grep<CR>";
          }
        ];
        # LSP
        lsp.formatOnSave = true;
        # languages
        languages = {
          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["alejandra"];
            lsp.enable = true;
            lsp.servers = ["nixd"];
            treesitter.enable = true;
          };
          lua = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["stylua"];
            lsp.enable = true;
            lsp.servers = ["lua-language-server"];
            treesitter.enable = true;
          };
          python = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["ruff"];
            lsp.enable = true;
            lsp.servers = ["ty"];
            treesitter.enable = true;
          };
          bash = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["shfmt"];
            lsp.enable = true;
            lsp.servers = ["bash-language-server"];
            treesitter.enable = true;
          };
          cmake = {
            enable = true;
            format.enable = true;
            format.type = ["gersemi"];
            lsp.enable = true;
            lsp.servers = ["neocmakelsp"];
            treesitter.enable = true;
          };
          make = {
            enable = true;
            format.enable = true;
            format.type = ["mbake"];
            treesitter.enable = true;
          };
          css = {
            enable = true;
            format.enable = true;
            format.type = ["biome"];
            lsp.enable = true;
            lsp.servers = ["vscode-css-language-server"];
            treesitter.enable = true;
          };
          docker = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["dockerfmt"];
            lsp.enable = true;
            lsp.servers = ["docker-language-server"];
            treesitter.enable = true;
          };
          env = {
            enable = true;
            extraDiagnostics.enable = true;
          };
          html = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["superhtml"];
            lsp.enable = true;
            lsp.servers = ["superhtml"];
            treesitter.enable = true;
          };
          json = {
            enable = true;
            format.enable = true;
            format.type = ["biome"];
            lsp.enable = true;
            lsp.servers = ["vscode-json-language-server"];
            treesitter.enable = true;
          };
          json5 = {
            enable = true;
            format.enable = true;
            format.type = ["prettier"];
            treesitter.enable = true;
          };
          sql = {
            enable = true;
            extensions.sqls-nvim.enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["sqruff"];
            lsp.enable = true;
            lsp.servers = ["sqls"];
            treesitter.enable = true;
          };
          toml = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["tombi"];
            lsp.enable = true;
            lsp.servers = ["tombi"];
            treesitter.enable = true;
          };
          xml = {
            enable = true;
            lsp.enable = true;
            lsp.servers = ["lemminx"];
            treesitter.enable = true;
          };
          yaml = {
            enable = true;
            format.enable = true;
            format.type = ["prettier"];
            lsp.enable = true;
            lsp.servers = ["yaml-language-server"];
            treesitter.enable = true;
          };
          typescript = {
            enable = true;
            extensions.ts-error-translator.enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["biome"];
            lsp.enable = true;
            lsp.servers = ["typescript-language-server"];
            treesitter.enable = true;
          };
          tsx = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            format.type = ["biome"];
            lsp.enable = true;
            lsp.servers = ["typescript-language-server"];
            treesitter.enable = true;
          };
        };

        # tresitter
        treesitter = {
          enable = true;
          autotagHtml = true;
          fold = false;
        };

        # git
        git = {
          enable = true;
          gitsigns.enable = true;
          hunk-nvim.enable = true;
        };
        # visuals
        visuals.nvim-web-devicons = {
          enable = true;
        };
        theme = {
          name = "tokyonight";
          style = "darker";
        };

        # nvim-tree
        filetree.nvimTree = {
          enable = true;
          setupOpts.view.side = "right";
        };
        filetree.nvimTree.mappings.focus = null;
        filetree.nvimTree.mappings.toggle = "<leader>h";
        luaConfigRC.myNvimTreeToggleFocus = ''
          vim.keymap.set('n', '<leader>tf', function()
            -- Check the filetype of the current window
            if vim.bo.filetype == 'NvimTree' then
              -- If in the tree, return to the previous window (buffer)
              vim.cmd('wincmd p')
            else
              -- If in the buffer, focus on the tree
              vim.cmd('NvimTreeFocus')
            end
          end, { desc = 'Toggle focus between buffer and nvim-tree' })
        '';

        # toggleterm
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
          lazygit.direction = "vertical";
          setupOpts = {
            winbar.enabled = false;
          };
        };
        luaConfigRC.myFloatTerm = ''
          local Terminal = require("toggleterm.terminal").Terminal
          local float_term = Terminal:new({
            direction = "float",
            hidden = true,
          })

          function _FLOAT_TERM_TOGGLE()
            float_term:toggle()
          end

          vim.keymap.set({ "n", "t" }, "<C-y>", "<cmd>lua _FLOAT_TERM_TOGGLE()<CR>", { desc = "Float terminal" })
        '';

        # nvimBufferline
        tabline.nvimBufferline = {
          enable = true;
          mappings.closeCurrent = "<leader>bd";
        };

        # fzf-lua
        fzf-lua = {
          enable = true;
        };

        # conform-nvim
        formatter.conform-nvim = {
          enable = true;
          presets.alejandra.enable = true;
        };
        luaConfigRC.myNixFormatOnSave = ''
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.nix",
            callback = function()
              require("conform").format({ async = false })
            end,
            desc = "Format Nix files on save with conform",
          })
        '';

        # blink
        autocomplete.blink-cmp = {
          enable = true;
        };

        # nvim-autopairs
        autopairs.nvim-autopairs.enable = true;

        # lualine
        statusline.lualine = {
          enable = true;
          setupOpts.options.globalstatus = true;
          setupOpts.sections.lualine_c = [];
          setupOpts.sections.lualine_z = [
            {
              "@1" = "";
              draw_empty = true;
              separator = {
                left = "";
                right = "";
              };
            }
            {
              "@1" = "fileformat";
              color = {
                fg = "black";
              };
              symbols = {
                dos = "";
                mac = "";
                unix = "";
              };
            }
          ];
        };
      };
    };
  };
}
