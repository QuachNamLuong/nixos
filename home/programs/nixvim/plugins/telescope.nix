{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings.defaults = {
      layout_strategy = "horizontal";
      prompt_prefix = "";
      sorting_strategy = "ascending";
    };
  };
}
