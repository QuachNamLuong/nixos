{ ... }:

{
  imports = [
    ./gpu/intel.nix

    ./input-method/fcitx5-lotus.nix
    ./programs
    ./system
  ];
}
