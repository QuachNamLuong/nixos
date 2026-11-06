{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settins.defaults = {
      layout_strategy = "horizontal";
      prompt_prefix = "";
      sorting_strategy = "ascending";
    };
  };
}
