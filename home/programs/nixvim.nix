{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    diagnostic.settings = {
      virtual_text = {
        enable = true;
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
    };

    globals.mapleader = " ";

    # Keymap toàn cục
    keymaps = [
      { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.silent = true; }
      { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; options.silent = true; }
      { mode = "n"; key = "<leader>e";  action = "<cmd>NvimTreeToggle<cr>"; options.silent = true; }
      { mode = "n"; key = "<leader>t"; action = "<cmd>ToggleTerm<cr>"; options.silent = true; }
    ];
    filetype.extension.tmpl = "templ";
    plugins = {
      lsp = {
        enable = true;
        servers = {
          gopls = { enable = true; };
          templ = { enable = true; };
          ts_ls = { enable = true; };
          nixd = {enable = true; };
        };
        keymaps = {
          lspBuf = {
            "K" = "hover";
          };
        };
      };

      auto-save = {
        enable = true;
        settings = { debounce_delay = 1000; };
      };

      treesitter.enable = true;
     
      telescope = {
        enable = true;
        settings.defaults = {
          layout_strategy = "horizontal";
          prompt_prefix = "🔍 ";
          sorting_strategy = "ascending";
        };
      };

      "nvim-tree" = {
        enable = true;
        settings = {
          disable_netrw = true;
          hijack_cursor = true;
          sync_root_with_cwd = true;
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          direction = "horizontal";
          size = 15;
          shade_terminals = true;
        };
      };

      luasnip.enable = true;

      # ĐÃ SỬA LẠI TOÀN BỘ KHỐI CMP DƯỚI ĐÂY
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
          ];

          mapping = {
            "<C-Space>" = {
              __raw = "cmp.mapping.complete()";
            };

            "<Tab>" = {
              __raw = ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';
            };

            "<S-Tab>" = {
              __raw = ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';
            };

            "<CR>" = {
              __raw = "cmp.mapping.confirm({ select = true })";
            };
          };
        };
      };
    };
  };
}
