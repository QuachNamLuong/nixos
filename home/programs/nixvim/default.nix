{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymaps.nix
    ./settings.nix

    ./plugins
  ];
}
