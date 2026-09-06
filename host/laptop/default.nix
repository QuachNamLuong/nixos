{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./user.nix
    ../../modules
  ];
}