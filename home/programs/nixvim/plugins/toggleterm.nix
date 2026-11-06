{ ... }:

{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "horizontal";
      size = 15;
      shade_terminals = true;
    };
  };
}
