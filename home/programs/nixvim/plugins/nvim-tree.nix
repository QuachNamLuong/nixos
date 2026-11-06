{ ... }:

{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    settings = {
      disable_netrw = true;
      hijack_cusor = true;
      sync_root_with_cwd = true;
    };
  };
}
