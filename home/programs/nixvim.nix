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

    # Keymap toàn cục (mở Telescope, nvim-tree...)
    keymaps = [
      { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.silent = true; }
      { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; options.silent = true; }
      { mode = "n"; key = "<leader>e";  action = "<cmd>NvimTreeToggle<cr>";     options.silent = true; }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          gopls = {
            enable = true;
          };
        };

        keymaps = {
          lspBuf = {
            "K" = "hover";
          };
        };
      };

      auto-save = {
        enable = true;
        settings = {
          debounce_delay = 1000;
        };
      };

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
          direction = "horizontal"; # Mở terminal theo chiều ngang (dưới cùng)
          size = 15;                # Chiều cao của terminal (số dòng)
          shade_terminals = true;   # Làm tối nền terminal để dễ phân biệt
        };
      };
    };
  };
}
