{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
    defaultEditor = true; # sets $EDITOR

    colorschemes.gruvbox.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      ignorecase = true;
      smartcase = true;
    };

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter = {
        enable = true;
        settings.ensure_installed = [ "nix" "lua" "python" "bash" ];
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          pyright.enable = true;
        };
      };
      cmp.enable = true;
    };

    keymaps = [
      { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<CR>"; }
      { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<CR>"; }
    ];
  };
}