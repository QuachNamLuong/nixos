{ ... }:

{
  programs.nixvim.keymaps = [
    { mode = "n"; key="<leader>ff"; action="<cmd>Telescope find_files<cr>"; options.silent = true; }
    { mode = "n"; key="<leader>e"; action="<cmd>NvimTreeToggle<cr>"; options.silent = true; }
    { mode = "n"; key="<leader>t";action="<cmd>ToggleTerm<cr>"; options.silent=true; }
  ];
}
